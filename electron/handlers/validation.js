export function isValidServerName(name) {
    if (!name || typeof name !== 'string') return false;
    // Allow alphanumeric, underscores, and hyphens.
    // Reject empty strings, null, undefined, and path traversal characters.
    return /^[a-zA-Z0-9_-]+$/.test(name);
}
