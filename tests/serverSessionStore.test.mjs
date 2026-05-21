import assert from 'assert/strict';
import { createServerSessionStore, SERVER_SESSION_STATUSES } from '../electron/handlers/serverSessionStore.js';

const store = createServerSessionStore({ maxLogs: 2 });
const snapshots = [];
const unsubscribe = store.subscribe((snapshot) => {
    snapshots.push(snapshot);
});

assert.deepEqual(store.getSnapshot(), {
    status: SERVER_SESSION_STATUSES.STOPPED,
    serverName: null,
    logs: [],
    passwordNeeded: false
});

store.patchSession({
    serverName: 'servertest',
    passwordNeeded: false,
    status: SERVER_SESSION_STATUSES.STARTING
});

store.addLog('first line');
store.addLog('second line');
store.addLog('third line');

assert.deepEqual(store.getLogs(), ['second line', 'third line'], 'log history should respect the configured cap');

store.setStatus(SERVER_SESSION_STATUSES.RUNNING);
store.setPasswordNeeded(true);
store.patchSession({
    passwordNeeded: false,
    status: SERVER_SESSION_STATUSES.STOPPING
});
store.setStatus(SERVER_SESSION_STATUSES.STOPPED);

assert.deepEqual(
    snapshots.map((snapshot) => ({
        status: snapshot.status,
        passwordNeeded: snapshot.passwordNeeded
    })),
    [
        { status: SERVER_SESSION_STATUSES.STARTING, passwordNeeded: false },
        { status: SERVER_SESSION_STATUSES.RUNNING, passwordNeeded: false },
        { status: SERVER_SESSION_STATUSES.RUNNING, passwordNeeded: true },
        { status: SERVER_SESSION_STATUSES.STOPPING, passwordNeeded: false },
        { status: SERVER_SESSION_STATUSES.STOPPED, passwordNeeded: false }
    ],
    'session listeners should receive the expected lifecycle transitions'
);

unsubscribe();

console.log('serverSessionStore.test.mjs passed');
