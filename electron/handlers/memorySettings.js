const DEFAULT_MEMORY_GB = 4;

function parseMemoryGb(value, fallback = DEFAULT_MEMORY_GB) {
    const matched = String(value ?? '').match(/\d+/);
    const parsed = matched ? Number.parseInt(matched[0], 10) : Number.NaN;

    if (!Number.isFinite(parsed) || parsed < 1) {
        return fallback;
    }

    return parsed;
}

export function normalizeMemorySettings(memory = {}) {
    const rawMin = memory.min;
    const rawMax = memory.max;
    const requestedMin = parseMemoryGb(memory.min);
    const requestedMax = parseMemoryGb(memory.max);
    const normalizedMin = requestedMin;
    const normalizedMax = Math.max(requestedMin, requestedMax);

    return {
        min: String(normalizedMin),
        max: String(normalizedMax),
        requestedMin: String(requestedMin),
        requestedMax: String(requestedMax),
        wasAdjusted: String(rawMin ?? '') !== String(normalizedMin) || String(rawMax ?? '') !== String(normalizedMax)
    };
}
