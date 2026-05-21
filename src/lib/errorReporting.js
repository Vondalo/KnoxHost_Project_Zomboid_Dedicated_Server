function getSelectedConfig() {
    try {
        return window.localStorage.getItem('lastSelectedConfig');
    } catch {
        return null;
    }
}

function serializeErrorLike(errorLike) {
    if (errorLike instanceof Error) {
        return {
            name: errorLike.name,
            message: errorLike.message,
            stack: errorLike.stack || null
        };
    }

    if (errorLike && typeof errorLike === 'object') {
        const candidate = {};

        if ('name' in errorLike) {
            candidate.name = errorLike.name;
        }
        if ('message' in errorLike) {
            candidate.message = errorLike.message;
        }
        if ('stack' in errorLike) {
            candidate.stack = errorLike.stack;
        }

        if (Object.keys(candidate).length > 0) {
            return candidate;
        }
    }

    let message = '[unserializable-error]';
    try {
        message = typeof errorLike === 'string' ? errorLike : JSON.stringify(errorLike);
    } catch {
        message = String(errorLike);
    }

    return {
        name: 'Error',
        message,
        stack: null
    };
}

export function buildRendererErrorPayload(source, details = {}) {
    return {
        source,
        timestamp: new Date().toISOString(),
        route: window.location.hash || window.location.pathname || '',
        href: window.location.href,
        selectedConfig: getSelectedConfig(),
        userAgent: navigator.userAgent,
        ...details,
        error: details.error ? serializeErrorLike(details.error) : null
    };
}

export function recordRendererError(source, details = {}) {
    if (!window.electronAPI?.recordRendererError) {
        return;
    }

    window.electronAPI.recordRendererError(buildRendererErrorPayload(source, details));
}

export async function reportRendererError(source, details = {}) {
    if (!window.electronAPI?.reportError) {
        throw new Error('Error reporting is unavailable in this environment.');
    }

    return await window.electronAPI.reportError(buildRendererErrorPayload(source, details));
}

export function registerGlobalRendererErrorHandlers() {
    window.addEventListener('error', (event) => {
        recordRendererError('window-error', {
            error: event.error || { message: event.message || 'Unknown renderer error' },
            metadata: {
                filename: event.filename,
                line: event.lineno,
                column: event.colno
            }
        });
    });

    window.addEventListener('unhandledrejection', (event) => {
        recordRendererError('window-unhandledrejection', {
            error: event.reason instanceof Error ? event.reason : { message: String(event.reason) },
            metadata: {
                reasonType: typeof event.reason
            }
        });
    });
}
