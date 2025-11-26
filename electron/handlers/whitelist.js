import Database from 'better-sqlite3';
import path from 'path';
import { app } from 'electron';
import fs from 'fs/promises';
import { constants } from 'fs';

// Helper for async file existence check
async function exists(filePath) {
    try {
        await fs.access(filePath, constants.F_OK);
        return true;
    } catch {
        return false;
    }
}

function getDbPath(serverName) {
    // PZ stores the whitelist in the server's specific DB file
    return path.join(app.getPath('home'), 'Zomboid', 'db', `${serverName}.db`);
}

export async function getWhitelist(serverName) {
    const dbPath = getDbPath(serverName);
    if (!(await exists(dbPath))) {
        return [];
    }

    let db;
    try {
        db = new Database(dbPath, { readonly: true });
        // Check if whitelist table exists
        const tableExists = db.prepare("SELECT name FROM sqlite_master WHERE type='table' AND name='whitelist'").get();
        if (!tableExists) return [];

        const rows = db.prepare('SELECT * FROM whitelist').all();
        return rows;
    } catch (err) {
        console.error(`Error reading whitelist from ${dbPath}:`, err);
        return [];
    } finally {
        if (db) db.close();
    }
}

export async function addToWhitelist(serverName, username, password, isAdmin = false) {
    const dbPath = getDbPath(serverName);

    // If DB doesn't exist, we might need to create it or wait for server to create it.
    // Usually server creates it. If we create it, we need correct schema.
    // For now, assume it exists or we fail.
    if (!(await exists(dbPath))) {
        throw new Error('Database does not exist. Start the server at least once.');
    }

    let db;
    try {
        db = new Database(dbPath);

        // Ensure table exists (just in case)
        db.exec(`
            CREATE TABLE IF NOT EXISTS whitelist (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT UNIQUE,
                password TEXT,
                admin BOOLEAN,
                lastConnection TEXT
            )
        `);

        const stmt = db.prepare('INSERT OR REPLACE INTO whitelist (username, password, admin) VALUES (?, ?, ?)');
        stmt.run(username, password, isAdmin ? 1 : 0);
        return { success: true };
    } catch (err) {
        console.error(`Error adding to whitelist in ${dbPath}:`, err);
        return { success: false, error: err.message };
    } finally {
        if (db) db.close();
    }
}

export async function removeFromWhitelist(serverName, username) {
    const dbPath = getDbPath(serverName);
    if (!(await exists(dbPath))) return { success: false, error: 'Database not found' };

    let db;
    try {
        db = new Database(dbPath);
        const stmt = db.prepare('DELETE FROM whitelist WHERE username = ?');
        const info = stmt.run(username);
        return { success: info.changes > 0 };
    } catch (err) {
        console.error(`Error removing from whitelist in ${dbPath}:`, err);
        return { success: false, error: err.message };
    } finally {
        if (db) db.close();
    }
}
