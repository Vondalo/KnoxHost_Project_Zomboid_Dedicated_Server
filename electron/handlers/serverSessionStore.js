export const SERVER_SESSION_STATUSES = Object.freeze({
    STOPPED: 'stopped',
    STARTING: 'starting',
    RUNNING: 'running',
    STOPPING: 'stopping'
});

export function createServerSessionStore({ maxLogs = 1000 } = {}) {
    const listeners = new Set();
    const state = {
        status: SERVER_SESSION_STATUSES.STOPPED,
        serverName: null,
        logs: [],
        passwordNeeded: false,
        players: []
    };

    const getSnapshot = () => ({
        status: state.status,
        serverName: state.serverName,
        logs: [...state.logs],
        passwordNeeded: state.passwordNeeded
    });

    const emit = () => {
        const snapshot = getSnapshot();
        for (const listener of listeners) {
            listener(snapshot);
        }
    };

    const patchSession = (patch, { notify = true } = {}) => {
        let changed = false;

        for (const [key, value] of Object.entries(patch)) {
            if (state[key] !== value) {
                state[key] = value;
                changed = true;
            }
        }

        if (changed && notify) {
            emit();
        }

        return changed;
    };

    return {
        subscribe(listener) {
            listeners.add(listener);
            return () => listeners.delete(listener);
        },
        getSnapshot,
        getLogs() {
            return [...state.logs];
        },
        getPlayers() {
            return [...state.players];
        },
        isActive() {
            return state.status !== SERVER_SESSION_STATUSES.STOPPED;
        },
        addLog(message) {
            state.logs.push(String(message));
            if (state.logs.length > maxLogs) {
                state.logs.splice(0, state.logs.length - maxLogs);
            }
        },
        patchSession,
        setStatus(status, options) {
            return patchSession({ status }, options);
        },
        setServerName(serverName, options) {
            return patchSession({ serverName }, options);
        },
        setPasswordNeeded(passwordNeeded, options) {
            return patchSession({ passwordNeeded }, options);
        },
        setPlayers(players) {
            state.players = Array.isArray(players) ? [...players] : [];
        }
    };
}
