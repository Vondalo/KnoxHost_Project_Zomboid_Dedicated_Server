export const SETTINGS_CHANGED_EVENT = 'knoxhost:settings-changed';

export function emitSettingsChanged(settings) {
    window.dispatchEvent(new CustomEvent(SETTINGS_CHANGED_EVENT, { detail: settings }));
}

export function subscribeToSettingsChanged(handler) {
    const listener = (event) => {
        handler(event.detail);
    };

    window.addEventListener(SETTINGS_CHANGED_EVENT, listener);
    return () => window.removeEventListener(SETTINGS_CHANGED_EVENT, listener);
}
