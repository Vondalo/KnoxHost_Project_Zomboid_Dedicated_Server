import React, { useState, useEffect } from 'react';
import { Save, Folder, AlertTriangle } from 'lucide-react';
import { motion } from 'framer-motion';

const Settings = () => {
    const [settings, setSettings] = useState({
        pzConfigPath: '',
        steamInstallPath: ''
    });
    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);
    const [message, setMessage] = useState(null);

    useEffect(() => {
        loadSettings();
    }, []);

    const loadSettings = async () => {
        try {
            const data = await window.electronAPI.getSettings();
            setSettings(data);
        } catch (error) {
            console.error('Failed to load settings:', error);
            setMessage({ type: 'error', text: 'Failed to load settings.' });
        } finally {
            setLoading(false);
        }
    };

    const handleSave = async () => {
        setSaving(true);
        setMessage(null);
        try {
            const success = await window.electronAPI.saveSettings(settings);
            if (success) {
                setMessage({ type: 'success', text: 'Settings saved successfully!' });
            } else {
                setMessage({ type: 'error', text: 'Failed to save settings.' });
            }
        } catch (error) {
            console.error('Failed to save settings:', error);
            setMessage({ type: 'error', text: 'An error occurred while saving.' });
        } finally {
            setSaving(false);
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setSettings(prev => ({ ...prev, [name]: value }));
    };

    if (loading) {
        return <div className="p-10 text-text-muted">Loading settings...</div>;
    }

    return (
        <div className="max-w-4xl mx-auto space-y-8">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-3xl font-bold text-text mb-2">Settings</h1>
                    <p className="text-text-muted">Configure application paths and preferences.</p>
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

            {message && (
                <motion.div
                    initial={{ opacity: 0, y: -10 }}
                    animate={{ opacity: 1, y: 0 }}
                    className={`p-4 rounded-md border ${message.type === 'success' ? 'bg-green-500/10 border-green-500/20 text-green-500' : 'bg-red-500/10 border-red-500/20 text-red-500'}`}
                >
                    {message.text}
                </motion.div>
            )}

            <div className="space-y-6">
                {/* Paths Configuration */}
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
                            <div className="relative">
                                <input
                                    type="text"
                                    name="pzConfigPath"
                                    value={settings.pzConfigPath}
                                    onChange={handleChange}
                                    placeholder="C:\Users\Username\Zomboid"
                                    className="w-full bg-surface border border-border rounded-md px-4 py-2 text-text focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary transition-colors"
                                />
                            </div>
                            <p className="text-xs text-text-muted">
                                The folder containing your Zomboid 'Server', 'Saves', and 'db' directories. Usually in your User folder.
                            </p>
                        </div>

                        <div className="space-y-2">
                            <label className="block text-sm font-medium text-text-muted">
                                Steam Installation Path
                            </label>
                            <div className="relative">
                                <input
                                    type="text"
                                    name="steamInstallPath"
                                    value={settings.steamInstallPath}
                                    onChange={handleChange}
                                    placeholder="C:\Program Files (x86)\Steam"
                                    className="w-full bg-surface border border-border rounded-md px-4 py-2 text-text focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary transition-colors"
                                />
                            </div>
                            <p className="text-xs text-text-muted">
                                The main Steam installation folder. Used to detect subscribed workshop mods.
                            </p>
                        </div>
                    </div>

                    <div className="flex items-start gap-3 p-4 bg-yellow-500/10 border border-yellow-500/20 rounded-md text-yellow-500 text-sm">
                        <AlertTriangle size={20} className="shrink-0 mt-0.5" />
                        <p>
                            Changing these paths will affect where the application looks for your server configurations and mods.
                            Ensure these paths are correct to avoid issues with missing data.
                        </p>
                    </div>
                </section>
            </div>
        </div>
    );
};

export default Settings;
