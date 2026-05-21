import os from 'node:os';
import process from 'node:process';
import { app } from 'electron';
import { getConfigs, readConfig } from './config.js';
import { sanitizeReportValue, serializeErrorLike } from './errorReportUtils.js';
import { getServerSession } from './server.js';
import { getSettings } from './settings.js';

const DISCORD_WEBHOOK_URL = 'https://discord.com/api/webhooks/1507132800611123320/rWqhnQyDSjnsnaBvObJdJsANVal7-ninzn6dm8D88ZRUfaLWhICFDZnsyv5vPVCVdpvx';
const MAX_RECORDED_ERRORS = 20;
const MAX_SERVER_LOG_LINES = 250;

const recordedErrors = [];

function rememberRecordedError(record) {
    recordedErrors.push(record);
    if (recordedErrors.length > MAX_RECORDED_ERRORS) {
        recordedErrors.splice(0, recordedErrors.length - MAX_RECORDED_ERRORS);
    }
}

function buildBaseRecord(origin, type, payload) {
    return sanitizeReportValue({
        origin,
        type,
        timestamp: new Date().toISOString(),
        ...payload
    });
}

async function readSelectedConfigSnapshot(selectedConfig) {
    if (!selectedConfig) {
        return null;
    }

    try {
        return await readConfig(selectedConfig);
    } catch (error) {
        return {
            loadError: serializeErrorLike(error)
        };
    }
}

async function buildDiagnosticsBundle(payload) {
    const selectedConfig = payload?.selectedConfig || null;
    const [settings, configNames, selectedConfigSnapshot] = await Promise.all([
        getSettings().catch((error) => ({ loadError: serializeErrorLike(error) })),
        getConfigs().catch((error) => ({ loadError: serializeErrorLike(error) })),
        readSelectedConfigSnapshot(selectedConfig)
    ]);

    const serverSession = getServerSession();
    const serverConsoleTail = Array.isArray(serverSession.logs)
        ? serverSession.logs.slice(-MAX_SERVER_LOG_LINES)
        : [];

    const diagnostics = {
        report: payload,
        app: {
            name: app.getName(),
            version: app.getVersion(),
            isPackaged: app.isPackaged,
            electron: process.versions.electron,
            chrome: process.versions.chrome,
            node: process.versions.node,
            platform: process.platform,
            arch: process.arch,
            osRelease: os.release()
        },
        settings,
        configNames,
        selectedConfigSnapshot,
        serverSession: {
            ...serverSession,
            logs: serverConsoleTail
        },
        recordedErrors: recordedErrors.slice(-MAX_RECORDED_ERRORS)
    };

    return sanitizeReportValue(diagnostics);
}

function buildDiscordContent(reportBundle) {
    const report = reportBundle.report || {};
    const error = report.error || {};

    return [
        '**KnoxHost Error Report**',
        `Time: ${reportBundle.app?.version || 'unknown'} | ${reportBundle.app?.platform || 'unknown'} ${reportBundle.app?.arch || ''}`.trim(),
        `Source: ${report.source || 'unknown'}`,
        `Route: ${report.route || 'unknown'}`,
        `Error: ${error.message || 'Unknown error'}`
    ].join('\n');
}

export function recordMainProcessError(type, errorLike, extra = {}) {
    rememberRecordedError(buildBaseRecord('main', type, {
        error: serializeErrorLike(errorLike),
        extra
    }));
}

export function recordRendererError(payload = {}) {
    rememberRecordedError(buildBaseRecord('renderer', payload.source || 'renderer-error', payload));
}

export async function submitErrorReport(payload = {}) {
    const sanitizedPayload = sanitizeReportValue({
        ...payload,
        error: payload?.error ? serializeErrorLike(payload.error) : null
    });

    const reportBundle = await buildDiagnosticsBundle(sanitizedPayload);
    const form = new FormData();

    form.append('payload_json', JSON.stringify({
        content: buildDiscordContent(reportBundle),
        allowed_mentions: { parse: [] }
    }));
    form.append(
        'files[0]',
        new Blob([JSON.stringify(reportBundle, null, 2)], { type: 'application/json' }),
        'knoxhost-error-report.json'
    );

    const serverLogLines = reportBundle.serverSession?.logs;
    if (Array.isArray(serverLogLines) && serverLogLines.length > 0) {
        form.append(
            'files[1]',
            new Blob([serverLogLines.join('\n')], { type: 'text/plain' }),
            'server-console-tail.log'
        );
    }

    const response = await fetch(DISCORD_WEBHOOK_URL, {
        method: 'POST',
        body: form
    });

    if (!response.ok) {
        const responseText = await response.text();
        throw new Error(`Discord webhook request failed (${response.status}): ${responseText || response.statusText}`);
    }

    return {
        success: true
    };
}
