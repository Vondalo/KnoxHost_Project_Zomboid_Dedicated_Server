const SENSITIVE_KEY_PATTERN = /(password|token|secret|webhook|cookie|auth|api[-_]?key)/i;
const DISCORD_WEBHOOK_PATTERN = /https:\/\/discord\.com\/api\/webhooks\/[^\s"'`]+/gi;
const MAX_STRING_LENGTH = 8000;
const MAX_ARRAY_ITEMS = 100;
const MAX_OBJECT_KEYS = 100;
const MAX_DEPTH = 6;

function truncateString(value, maxLength = MAX_STRING_LENGTH) {
    if (value.length <= maxLength) {
        return value;
    }

    return `${value.slice(0, maxLength)}...[truncated ${value.length - maxLength} chars]`;
}

function isSensitiveKey(keyPath) {
    return keyPath.some((segment) => SENSITIVE_KEY_PATTERN.test(segment));
}

function sanitizeString(value) {
    return truncateString(String(value).replace(DISCORD_WEBHOOK_PATTERN, '[redacted-webhook-url]'));
}

export function serializeErrorLike(errorLike) {
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

export function sanitizeReportValue(value, keyPath = [], depth = 0) {
    if (depth > MAX_DEPTH) {
        return '[truncated-depth]';
    }

    if (isSensitiveKey(keyPath)) {
        return '[redacted]';
    }

    if (value == null || typeof value === 'boolean' || typeof value === 'number') {
        return value;
    }

    if (typeof value === 'string') {
        return sanitizeString(value);
    }

    if (value instanceof Error) {
        return sanitizeReportValue(serializeErrorLike(value), keyPath, depth + 1);
    }

    if (Array.isArray(value)) {
        const items = value.slice(0, MAX_ARRAY_ITEMS).map((item, index) => sanitizeReportValue(item, [...keyPath, String(index)], depth + 1));
        if (value.length > MAX_ARRAY_ITEMS) {
            items.push(`[truncated ${value.length - MAX_ARRAY_ITEMS} more items]`);
        }
        return items;
    }

    if (typeof value === 'object') {
        const entries = Object.entries(value);
        const limitedEntries = entries.slice(0, MAX_OBJECT_KEYS);
        const sanitized = {};

        for (const [key, nestedValue] of limitedEntries) {
            sanitized[key] = sanitizeReportValue(nestedValue, [...keyPath, key], depth + 1);
        }

        if (entries.length > MAX_OBJECT_KEYS) {
            sanitized.__truncatedKeys = `[truncated ${entries.length - MAX_OBJECT_KEYS} more keys]`;
        }

        return sanitized;
    }

    return sanitizeString(String(value));
}
