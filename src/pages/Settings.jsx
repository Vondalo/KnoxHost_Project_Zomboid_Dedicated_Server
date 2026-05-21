import React, { useEffect, useState } from 'react';
import { Save, Folder, AlertTriangle, Server, Sparkles } from 'lucide-react';
import { useToast } from '../context/ToastContext';
import { emitSettingsChanged } from '../lib/appSettings';

const DEFAULT_SETTINGS = {
    pzConfigPath: '',
    steamInstallPath: '',
    enableDedicatedServer: false,
    uiEffectsEnabled: true
};

const Toggle = ({ checked, onChange }) => (
    <label className="relative inline-flex items-center cursor-pointer">
        <input
            type="checkbox"
            checked={checked}
            onChange={(e) => onChange(e.target.checked)}
            className="sr-only peer"
        />
        <div className="w-11 h-6 bg-surface-hover peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-primary/30 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary" />
    </label>
);

const Settings = () => {
    const [settings, setSettings] = useState(DEFAULT_SETTINGS);
    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);
    const toast = useToast();

    useEffect(() => {
        loadSettings();
    }, []);

    const loadSettings = async () => {
        try {
            const data = await window.electronAPI.getSettings();
            setSettings({ ...DEFAULT_SETTINGS, ...data });
        } catch (error) {
            console.error('Failed to load settings:', error);
            toast.error('Failed to load settings.');
        } finally {
            setLoading(false);
        }
    };

    const handleSave = async () => {
        if (!settings.pzConfigPath.trim() || !settings.steamInstallPath.trim()) {
            toast.error('Paths cannot be empty.');
            return;
        }

        setSaving(true);
        try {
            const success = await window.electronAPI.saveSettings(settings);
            if (success) {
                emitSettingsChanged(settings);
                toast.success('Settings saved successfully!');
            } else {
                toast.error('Failed to save settings.');
            }
        } catch (error) {
            console.error('Failed to save settings:', error);
            toast.error('An error occurred while saving.');
        } finally {
            setSaving(false);
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setSettings((prev) => ({ ...prev, [name]: value }));
    };

    if (loading) {
        return <div className="p-10 text-text-muted">Loading settings...</div>;
    }

    return (
        <div className="max-w-4xl mx-auto space-y-8">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-3xl font-bold text-text mb-2">Settings</h1>
                    <p className="text-text-muted">Configure application paths, mode, and UI preferences.</p>
                </div>
                <button
                    onClick={handleSave}
                    disabled={saving}
                    className="flex items-center gap-2 px-4 py-2 bg-primary text-white rounded-md hover:bg-primary-hover transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                >
                    <Save size={20} />
                    {saving ? 'Saving...' : 'Save Settings'}
                </button>
            </div>

            <div className="space-y-6">
                <section className="bg-surface/50 border border-border rounded-lg p-6 space-y-6">
                    <div className="flex items-center gap-3 mb-4">
                        <Folder className="text-primary" size={24} />
                        <h2 className="text-xl font-semibold text-text">Path Configuration</h2>
                    </div>

                    <div className="space-y-4">
                        <div className="space-y-2">
                            <label className="block text-sm font-medium text-text-muted">
                                Project Zomboid Data Path
                            </label>
                            <input
                                type="text"
                                name="pzConfigPath"
                                value={settings.pzConfigPath}
                                onChange={handleChange}
                                placeholder="C:\\Users\\Username\\Zomboid"
                                className="w-full bg-surface border border-border rounded-md px-4 py-2 text-text focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary transition-colors"
                            />
                            <p className="text-xs text-text-muted">
                                The folder containing your Zomboid `Server`, `Saves`, and `db` directories.
                            </p>
                        </div>

                        <div className="space-y-2">
                            <label className="block text-sm font-medium text-text-muted">
                                Steam Installation Path
                            </label>
                            <input
                                type="text"
                                name="steamInstallPath"
                                value={settings.steamInstallPath}
                                onChange={handleChange}
                                placeholder="C:\\Program Files (x86)\\Steam"
                                className="w-full bg-surface border border-border rounded-md px-4 py-2 text-text focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary transition-colors"
                            />
                            <p className="text-xs text-text-muted">
                                Used to discover subscribed Project Zomboid workshop content.
                            </p>
                        </div>
                    </div>

                    <div className="flex items-start gap-3 p-4 bg-yellow-500/10 border border-yellow-500/20 rounded-md text-yellow-500 text-sm">
                        <AlertTriangle size={20} className="shrink-0 mt-0.5" />
                        <p>
                            Changing these paths affects where the app reads configurations and workshop data.
                            Save after changes, then reload the relevant page if you already have it open.
                        </p>
                    </div>
                </section>

                <section className="bg-surface/50 border border-border rounded-lg p-6 space-y-6">
                    <div className="flex items-center gap-3 mb-4">
                        <Server className="text-primary" size={24} />
                        <h2 className="text-xl font-semibold text-text">Application Mode</h2>
                    </div>

                    <div className="flex items-center justify-between p-4 bg-surface border border-border rounded-md">
                        <div className="space-y-1">
                            <h3 className="font-medium text-text">Enable Dedicated Server Features</h3>
                            <p className="text-sm text-text-muted">
                                Unlocks admin, whitelist, RCON, and dedicated server controls.
                            </p>
                        </div>
                        <Toggle
                            checked={settings.enableDedicatedServer || false}
                            onChange={(checked) => setSettings((prev) => ({ ...prev, enableDedicatedServer: checked }))}
                        />
                    </div>
                </section>

                <section className="bg-surface/50 border border-border rounded-lg p-6 space-y-6">
                    <div className="flex items-center gap-3 mb-4">
                        <Sparkles className="text-primary" size={24} />
                        <h2 className="text-xl font-semibold text-text">UI Effects</h2>
                    </div>

                    <div className="flex items-center justify-between p-4 bg-surface border border-border rounded-md">
                        <div className="space-y-1">
                            <h3 className="font-medium text-text">Fancy Cursor and Background Effects</h3>
                            <p className="text-sm text-text-muted">
                                Turns the custom cursor and animated particle background on or off immediately after saving.
                            </p>
                        </div>
                        <Toggle
                            checked={settings.uiEffectsEnabled !== false}
                            onChange={(checked) => setSettings((prev) => ({ ...prev, uiEffectsEnabled: checked }))}
                        />
                    </div>
                </section>
            </div>
        </div>
    );
};

export default Settings;
