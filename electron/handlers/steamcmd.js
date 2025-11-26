import { spawn } from 'child_process';
import path from 'path';
import fs from 'fs';
import https from 'https';
import { app } from 'electron';

const STEAMCMD_URL = 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip';
const INSTALL_DIR = path.join(app.getPath('userData'), 'steamcmd');
const SERVER_DIR = path.join(app.getPath('userData'), 'server');

export async function ensureSteamCMD() {
    if (!fs.existsSync(INSTALL_DIR)) {
        fs.mkdirSync(INSTALL_DIR, { recursive: true });
    }

    const exePath = path.join(INSTALL_DIR, 'steamcmd.exe');
    if (fs.existsSync(exePath)) {
        return exePath;
    }

    const zipPath = path.join(INSTALL_DIR, 'steamcmd.zip');

    await new Promise((resolve, reject) => {
        const file = fs.createWriteStream(zipPath);
        https.get(STEAMCMD_URL, (response) => {
            response.pipe(file);
            file.on('finish', () => {
                file.close();
                resolve();
            });
        }).on('error', (err) => {
            fs.unlink(zipPath, () => { });
            reject(err);
        });
    });

    // Unzip using PowerShell
    await new Promise((resolve, reject) => {
        const ps = spawn('powershell', [
            '-Command',
            `Expand-Archive -Path "${zipPath}" -DestinationPath "${INSTALL_DIR}" -Force`
        ]);
        ps.on('close', (code) => {
            if (code === 0) resolve();
            else reject(new Error(`Unzip failed with code ${code}`));
        });
    });

    return exePath;
}

export async function runSteamCMD(args, onLog) {
    const exePath = await ensureSteamCMD();
    return new Promise((resolve, reject) => {
        const proc = spawn(exePath, args, { cwd: INSTALL_DIR });

        proc.stdout.on('data', (data) => {
            const msg = data.toString();
            console.log(`SteamCMD: ${msg}`);
            if (onLog) onLog(msg);
        });
        proc.stderr.on('data', (data) => {
            const msg = data.toString();
            console.error(`SteamCMD Error: ${msg}`);
            if (onLog) onLog(msg);
        });

        proc.on('close', (code) => {
            if (code === 0) resolve();
            else reject(new Error(`SteamCMD exited with code ${code}`));
        });
    });
}

export async function installServer(onLog) {
    if (!fs.existsSync(SERVER_DIR)) {
        fs.mkdirSync(SERVER_DIR, { recursive: true });
    }

    if (onLog) onLog(`Installing to: ${SERVER_DIR}`);

    const maxRetries = 3;
    for (let i = 0; i < maxRetries; i++) {
        try {
            if (onLog) onLog(`Attempt ${i + 1}/${maxRetries}: Installing server...`);
            // Try without validate first to avoid 0x602 error on fresh install
            await runSteamCMD(['+force_install_dir', SERVER_DIR, '+login', 'anonymous', '+app_update', '380870', '+quit'], onLog);
            return; // Success
        } catch (err) {
            // Check if the server file exists despite the error (e.g. exit code 7 or 8)
            const batPath = path.join(SERVER_DIR, 'StartServer64.bat');
            if (fs.existsSync(batPath)) {
                if (onLog) onLog(`Warning: SteamCMD exited with error, but server file found. The installation might be incomplete.`);
                return;
            } else {
                if (onLog) onLog(`Attempt ${i + 1} failed: ${err.message}`);
                if (i === maxRetries - 1) throw err; // Throw on last failure
                // Wait a bit before retrying
                await new Promise(resolve => setTimeout(resolve, 2000));
            }
        }
    }
}

export async function downloadMods(modIds, onLog) {
    if (!modIds || modIds.length === 0) return;

    if (onLog) onLog(`Checking/Downloading ${modIds.length} mods via SteamCMD...`);

    // Batch size to avoid command line length limits (Windows limit is 8191 chars)
    // Each mod adds ~50 chars. 50 mods * 50 chars = 2500 chars, well within safety.
    const BATCH_SIZE = 20;

    for (let i = 0; i < modIds.length; i += BATCH_SIZE) {
        const batch = modIds.slice(i, i + BATCH_SIZE);
        const currentBatchNum = Math.floor(i / BATCH_SIZE) + 1;
        const totalBatches = Math.ceil(modIds.length / BATCH_SIZE);

        if (onLog) onLog(`Processing batch ${currentBatchNum}/${totalBatches} (${batch.length} mods)...`);

        const args = ['+force_install_dir', SERVER_DIR, '+login', 'anonymous'];
        for (const id of batch) {
            args.push('+workshop_download_item', '108600', id);
        }
        args.push('+quit');

        try {
            await runSteamCMD(args, onLog);
        } catch (err) {
            if (onLog) onLog(`Error downloading batch ${currentBatchNum}: ${err.message}`);
            throw err;
        }
    }

    if (onLog) onLog('All mod downloads complete.');
    return true;
}

export async function installWorkshopItem(appId, workshopId, onLog) {
    // Deprecated in favor of downloadMods for bulk operations, but kept for compatibility if needed
    return downloadMods([workshopId], onLog);
}
