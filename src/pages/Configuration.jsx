import React, { useEffect, useMemo, useState } from 'react';
import { Save, RefreshCw, Plus, Trash2, Search, Settings, X, FolderOpen, Box, Layers, Cpu, Check, MapPin, Skull, Copy, AlertCircle, Download, Server, ExternalLink } from 'lucide-react';
import { PRESETS } from '../data/presets';
import { motion, AnimatePresence } from 'framer-motion';
import clsx from 'clsx';
import { useToast } from '../context/ToastContext';
import ConfirmationModal from '../components/ConfirmationModal';

const DEFAULT_DATA = {
    config: {},
    sandbox: {},
    spawnregions: '',
    zombies: {},
    metadata: {
        memory: {
            min: '4',
            max: '4'
        }
    }
};
void motion;

function parseMemoryGb(value, fallback = 4) {
    const parsed = Number.parseInt(String(value ?? ''), 10);
    return Number.isFinite(parsed) && parsed >= 1 ? parsed : fallback;
}

function normalizeMemorySelection(memory, changedField) {
    const nextMin = parseMemoryGb(memory.min);
    const nextMax = parseMemoryGb(memory.max);

    if (changedField === 'min' && nextMin > nextMax) {
        return { min: String(nextMin), max: String(nextMin) };
    }

    if (changedField === 'max' && nextMax < nextMin) {
        return { min: String(nextMax), max: String(nextMax) };
    }

    return { min: String(nextMin), max: String(nextMax) };
}

const ConfigField = ({ section, settingKey, value, onChange }) => {
    const type = typeof value;

    if (typeof settingKey === 'string' && settingKey.toLowerCase().includes('password')) {
        return (
            <input
                type="password"
                value={value}
                onChange={(e) => onChange(section, settingKey, e.target.value)}
                className="w-full bg-background border border-border rounded px-3 py-1.5 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary transition-all font-mono"
            />
        );
    }

    if (type === 'boolean') {
        return (
            <button
                onClick={() => onChange(section, settingKey, !value)}
                className={clsx(
                    'w-10 h-5 rounded-full transition-colors relative focus:outline-none focus:ring-1 focus:ring-primary',
                    value ? 'bg-primary' : 'bg-surface-hover'
                )}
            >
                <motion.div
                    className="absolute top-1 left-1 w-3 h-3 rounded-full bg-white"
                    animate={{ x: value ? 20 : 0 }}
                    transition={{ type: 'spring', stiffness: 500, damping: 30 }}
                />
            </button>
        );
    }

    if (type === 'number') {
        return (
            <input
                type="number"
                value={value}
                onChange={(e) => onChange(section, settingKey, Number(e.target.value))}
                className="w-full bg-background border border-border rounded px-3 py-1.5 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary transition-all font-mono"
            />
        );
    }

    return (
        <input
            type="text"
            value={value}
            onChange={(e) => onChange(section, settingKey, e.target.value)}
            className="w-full bg-background border border-border rounded px-3 py-1.5 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary transition-all font-mono"
        />
    );
};

const tabClassName = (active) => clsx(
    'relative px-4 py-2 flex items-center gap-2 rounded-md transition-colors text-sm font-medium whitespace-nowrap z-10',
    active ? 'text-white' : 'text-text-muted hover:text-text'
);

const Configuration = () => {
    const toast = useToast();
    const [configs, setConfigs] = useState([]);
    const [selectedConfig, setSelectedConfig] = useState(() => localStorage.getItem('lastSelectedConfig') || 'servertest');
    const [data, setData] = useState(DEFAULT_DATA);
    const [lastLoadedSerialized, setLastLoadedSerialized] = useState(JSON.stringify(DEFAULT_DATA));
    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);
    const [searchTerm, setSearchTerm] = useState('');
    const [activeTab, setActiveTab] = useState('general');
    const [showAddModModal, setShowAddModModal] = useState(false);
    const [showNewConfigModal, setShowNewConfigModal] = useState(false);
    const [showDeleteModal, setShowDeleteModal] = useState(false);
    const [deleteWorldData, setDeleteWorldData] = useState(false);
    const [newConfigName, setNewConfigName] = useState('');
    const [installedMods, setInstalledMods] = useState([]);
    const [workshopResults, setWorkshopResults] = useState([]);
    const [workshopQuery, setWorkshopQuery] = useState('');
    const [workshopLoading, setWorkshopLoading] = useState(false);
    const [modPickerSource, setModPickerSource] = useState('installed');
    const [modSearchTerm, setModSearchTerm] = useState('');
    const [copyStatus, setCopyStatus] = useState('');
    const [busyModId, setBusyModId] = useState(null);
    const [confirmation, setConfirmation] = useState({ isOpen: false, title: '', message: '', onConfirm: () => { }, confirmText: 'Confirm', confirmColor: 'bg-primary' });

    useEffect(() => {
        loadConfigs();
        loadInstalledMods();
    }, []);

    useEffect(() => {
        if (selectedConfig) {
            loadData(selectedConfig, true);
            localStorage.setItem('lastSelectedConfig', selectedConfig);
        }
    }, [selectedConfig]);

    const serializedData = useMemo(() => JSON.stringify(data), [data]);
    const isDirty = serializedData !== lastLoadedSerialized;

    const getEnabledWorkshopIds = () => (
        (data.config?.WorkshopItems || '')
            .split(';')
            .map((id) => id.trim())
            .filter(Boolean)
    );

    const enabledWorkshopIds = useMemo(() => new Set(getEnabledWorkshopIds()), [data.config?.WorkshopItems]);

    const loadConfigs = async () => {
        if (!window.electronAPI) {
            return;
        }

        const list = await window.electronAPI.getConfigs();
        setConfigs(list);
        if (list.length > 0 && !list.includes(selectedConfig)) {
            setSelectedConfig(list[0]);
        }
    };

    const loadInstalledMods = async () => {
        if (!window.electronAPI) {
            return [];
        }

        try {
            const mods = await window.electronAPI.getMods();
            setInstalledMods(mods);
            return mods;
        } catch (error) {
            console.error('Failed to load installed mods:', error);
            toast.error('Failed to load installed workshop items.');
            return [];
        }
    };

    const loadData = async (name, allowDiscard = false) => {
        if (!window.electronAPI || !name) {
            return;
        }

        if (!allowDiscard && isDirty && !window.confirm('You have unsaved changes. Reload from disk and discard them?')) {
            return;
        }

        setLoading(true);
        try {
            const result = await window.electronAPI.readConfig(name);
            setData(result);
            setLastLoadedSerialized(JSON.stringify(result));
        } catch (error) {
            console.error('Failed to load config:', error);
            toast.error('Failed to load configuration.');
        } finally {
            setLoading(false);
        }
    };

    const reloadCurrentConfig = async () => {
        if (!selectedConfig) {
            return;
        }

        await Promise.all([
            loadData(selectedConfig),
            loadInstalledMods()
        ]);
    };

    const runWorkshopSearch = async (query = workshopQuery) => {
        if (!window.electronAPI) {
            return;
        }

        setWorkshopLoading(true);
        try {
            const results = await window.electronAPI.searchMods(query);
            setWorkshopResults(results);
        } catch (error) {
            console.error('Failed to browse workshop:', error);
            toast.error('Failed to browse Steam Workshop.');
        } finally {
            setWorkshopLoading(false);
        }
    };

    const handleCreateConfig = async () => {
        if (!newConfigName) {
            return;
        }

        if (!/^[a-zA-Z0-9_-]+$/.test(newConfigName)) {
            toast.error('Config name can only contain letters, numbers, underscores, and hyphens.');
            return;
        }

        if (configs.includes(newConfigName)) {
            toast.error('Config name already exists.');
            return;
        }

        const newData = {
            config: {
                Public: true,
                PublicName: `My Server - ${newConfigName}`,
                MaxPlayers: 16
            },
            sandbox: {
                ZombieLore: { Speed: 2, Strength: 2, Toughness: 2, Transmission: 1, Mortality: 5, Reanimate: 3, Cognition: 3, Memory: 2, Decomposition: 1, Sight: 2, Hearing: 2, Smell: 2, Thump: false }
            },
            spawnregions: 'function SpawnRegions()\n\treturn {\n\t\t{ name = "Muldraugh, KY", file = "media/maps/Muldraugh, KY/spawnpoints.lua" },\n\t\t{ name = "Riverside, KY", file = "media/maps/Riverside, KY/spawnpoints.lua" },\n\t\t{ name = "Rosewood, KY", file = "media/maps/Rosewood, KY/spawnpoints.lua" },\n\t\t{ name = "West Point, KY", file = "media/maps/West Point, KY/spawnpoints.lua" },\n\t}\nend',
            zombies: {},
            metadata: {
                memory: {
                    min: '4',
                    max: '4'
                }
            }
        };

        const result = await window.electronAPI.saveConfig(newConfigName, newData);
        if (!result.success) {
            toast.error(result.errors.join('\n'));
            return;
        }

        await loadConfigs();
        setSelectedConfig(newConfigName);
        setShowNewConfigModal(false);
        setNewConfigName('');
        toast.success(`Configuration "${newConfigName}" created.`);
    };

    const handleDeleteConfig = async () => {
        if (!window.electronAPI) {
            return;
        }

        const success = await window.electronAPI.deleteConfig(selectedConfig, deleteWorldData);
        if (!success) {
            toast.error('Failed to delete configuration.');
            return;
        }

        const deletedName = selectedConfig;
        await loadConfigs();
        setShowDeleteModal(false);
        setDeleteWorldData(false);
        const remaining = configs.filter((configName) => configName !== deletedName);
        setSelectedConfig(remaining[0] || 'servertest');
        toast.success(`Configuration "${deletedName}" deleted.`);
    };

    const handleSave = async () => {
        if (!window.electronAPI || !selectedConfig) {
            return;
        }

        setSaving(true);
        try {
            const result = await window.electronAPI.saveConfig(selectedConfig, data);
            if (!result.success) {
                toast.error(result.errors.join('\n'));
                return;
            }

            await loadData(selectedConfig, true);
            toast.success('Configuration saved successfully.');
        } catch (error) {
            console.error('Failed to save configuration:', error);
            toast.error('Failed to save configuration.');
        } finally {
            setSaving(false);
        }
    };

    const handleConfigChange = (section, key, value) => {
        setData((prev) => {
            const next = { ...prev };
            const sectionData = { ...(next[section] || {}) };

            if (key.includes('.')) {
                const parts = key.split('.');
                let current = sectionData;
                for (let index = 0; index < parts.length - 1; index += 1) {
                    const part = parts[index];
                    current[part] = { ...(current[part] || {}) };
                    current = current[part];
                }
                current[parts[parts.length - 1]] = value;
            } else {
                sectionData[key] = value;
            }

            next[section] = sectionData;
            return next;
        });
    };

    const handleMemoryChange = (changedField, value) => {
        const nextMemory = normalizeMemorySelection({
            ...(data.metadata?.memory || { min: '4', max: '4' }),
            [changedField]: value
        }, changedField);

        handleConfigChange('metadata', 'memory', nextMemory);
    };

    const handleSpawnRegionsChange = (value) => {
        setData((prev) => ({ ...prev, spawnregions: value }));
    };

    const flattenObject = (obj, prefix = '') => (
        Object.keys(obj || {}).reduce((acc, key) => {
            const value = obj[key];
            const nextPrefix = prefix ? `${prefix}.${key}` : key;
            if (typeof value === 'object' && value !== null && !Array.isArray(value)) {
                Object.assign(acc, flattenObject(value, nextPrefix));
            } else {
                acc[nextPrefix] = value;
            }
            return acc;
        }, {})
    );

    const filteredSettings = useMemo(() => {
        let target;
        if (activeTab === 'sandbox') {
            target = data.sandbox;
        } else if (activeTab === 'zombies') {
            target = data.zombies;
        } else {
            target = data.config;
        }

        if (!target) {
            return {};
        }

        const flattenedTarget = flattenObject(target);
        const ignoredKeys = ['WorkshopItems', 'Mods', 'Map', 'SpawnPoint'];

        return Object.fromEntries(
            Object.entries(flattenedTarget).filter(([key]) => {
                if (activeTab === 'general' && ignoredKeys.includes(key)) {
                    return false;
                }
                if (!searchTerm) {
                    return true;
                }
                return key.toLowerCase().includes(searchTerm.toLowerCase());
            })
        );
    }, [activeTab, data, searchTerm]);

    const handleAddInstalledMod = async (mod) => {
        if (!window.electronAPI || !selectedConfig) {
            return;
        }

        const modIds = mod.mods.map((entry) => entry.id).filter(Boolean);
        if (modIds.length === 0) {
            toast.error(`"${mod.title}" has no detected mod IDs.`);
            return;
        }

        setBusyModId(mod.workshopId);
        try {
            const result = await window.electronAPI.addMod(selectedConfig, mod.workshopId, modIds);
            if (!result.success) {
                throw new Error(result.error || 'Failed to add the mod.');
            }

            toast.success(`Added mod: ${mod.title}`);
            await Promise.all([
                loadData(selectedConfig, true),
                loadInstalledMods()
            ]);
        } catch (error) {
            console.error('Failed to add mod:', error);
            toast.error(error.message || `Failed to add ${mod.title}`);
        } finally {
            setBusyModId(null);
        }
    };

    const handleRemoveMod = async (workshopId) => {
        if (!window.electronAPI || !selectedConfig) {
            return;
        }

        const mod = installedMods.find((entry) => entry.workshopId === workshopId);
        if (!mod) {
            toast.error('Unable to resolve the installed mod IDs for removal. Reload installed mods and try again.');
            return;
        }

        setBusyModId(workshopId);
        try {
            const result = await window.electronAPI.removeMod(
                selectedConfig,
                workshopId,
                mod.mods.map((entry) => entry.id).filter(Boolean)
            );

            if (!result.success) {
                throw new Error(result.error || 'Failed to remove the mod.');
            }

            toast.success(`Removed mod: ${mod.title}`);
            await loadData(selectedConfig, true);
        } catch (error) {
            console.error('Failed to remove mod:', error);
            toast.error(error.message || 'Failed to remove the mod.');
        } finally {
            setBusyModId(null);
        }
    };

    const handleInstallAndAddWorkshopMod = async (result) => {
        if (!window.electronAPI || !selectedConfig) {
            return;
        }

        setBusyModId(result.workshopId);
        try {
            if (!result.installed) {
                await window.electronAPI.installMod(result.workshopId);
            }

            const refreshedInstalledMods = await loadInstalledMods();
            const installedMod = refreshedInstalledMods.find((entry) => entry.workshopId === result.workshopId);
            if (!installedMod || installedMod.mods.length === 0) {
                throw new Error('Workshop item downloaded, but no usable mod.info entries were detected.');
            }

            if (!enabledWorkshopIds.has(result.workshopId)) {
                const addResult = await window.electronAPI.addMod(
                    selectedConfig,
                    installedMod.workshopId,
                    installedMod.mods.map((entry) => entry.id).filter(Boolean)
                );

                if (!addResult.success) {
                    throw new Error(addResult.error || 'Failed to add the workshop item to the configuration.');
                }
            }

            toast.success(`${result.title} is now available in ${selectedConfig}.`);
            await Promise.all([
                loadData(selectedConfig, true),
                runWorkshopSearch(workshopQuery)
            ]);
        } catch (error) {
            console.error('Failed to install/add workshop mod:', error);
            toast.error(error.message || `Failed to install ${result.title}`);
        } finally {
            setBusyModId(null);
        }
    };

    const handleCopyMods = async () => {
        if (!window.electronAPI) {
            return;
        }

        setLoading(true);
        setCopyStatus('Analyzing client mods...');

        try {
            const ids = getEnabledWorkshopIds();
            if (ids.length === 0) {
                toast.info('No mods enabled in configuration to copy.');
                return;
            }

            setCopyStatus(`Copying ${ids.length} mods...`);
            const result = await window.electronAPI.copyModsFromClient(ids);
            if (result.success) {
                toast.success(`Successfully copied ${result.count} mods to the server folder.`);
            } else {
                toast.error(`Error copying mods: ${result.error}`);
            }
        } catch (error) {
            console.error(error);
            toast.error('Failed to copy mods.');
        } finally {
            setLoading(false);
            setCopyStatus('');
        }
    };

    const handleApplyPreset = (presetKey) => {
        const preset = PRESETS[presetKey];
        if (!preset) {
            return;
        }

        setConfirmation({
            isOpen: true,
            title: 'Apply Preset?',
            message: `Apply preset "${preset.label}"? This will overwrite the current sandbox settings.`,
            confirmText: 'Apply',
            confirmColor: 'bg-primary',
            onConfirm: () => {
                setData((prev) => {
                    const nextSandbox = JSON.parse(JSON.stringify(prev.sandbox || {}));
                    const merge = (target, source) => {
                        for (const key of Object.keys(source)) {
                            if (source[key] instanceof Object && !Array.isArray(source[key])) {
                                if (!target[key]) {
                                    target[key] = {};
                                }
                                merge(target[key], source[key]);
                            } else {
                                target[key] = source[key];
                            }
                        }
                    };
                    merge(nextSandbox, preset.data);
                    return { ...prev, sandbox: nextSandbox };
                });
                toast.success(`Preset "${preset.label}" applied. Save to persist it.`);
            }
        });
    };

    const filteredInstalledMods = useMemo(() => (
        installedMods.filter((mod) => (
            mod.title.toLowerCase().includes(modSearchTerm.toLowerCase()) ||
            mod.workshopId.includes(modSearchTerm)
        ))
    ), [installedMods, modSearchTerm]);

    const renderTabs = () => (
        <div className="flex gap-2 border-b border-border mb-6 overflow-x-auto pb-1">
            {[
                { id: 'general', icon: Settings, label: 'General' },
                { id: 'mods', icon: Box, label: 'Mods', count: enabledWorkshopIds.size },
                { id: 'sandbox', icon: Layers, label: 'Sandbox' },
                { id: 'zombies', icon: Skull, label: 'Zombies' },
                { id: 'spawns', icon: MapPin, label: 'Spawns' },
                { id: 'saves', icon: FolderOpen, label: 'Saves' }
            ].map((tab) => {
                const active = activeTab === tab.id;
                return (
                    <button key={tab.id} onClick={() => setActiveTab(tab.id)} className={tabClassName(active)}>
                        {active && (
                            <motion.div
                                layoutId="activeTab"
                                className="absolute inset-0 bg-surface-hover border border-border rounded-md shadow-sm -z-10"
                                transition={{ type: 'spring', bounce: 0.2, duration: 0.6 }}
                            />
                        )}
                        <tab.icon size={16} className={clsx('transition-colors', active ? 'text-primary' : 'text-text-muted')} />
                        {tab.label}
                        {tab.count !== undefined && (
                            <span className={clsx(
                                'text-xs px-1.5 py-0.5 rounded-full transition-colors',
                                active ? 'bg-primary text-white' : 'bg-border text-text-muted'
                            )}>
                                {tab.count}
                            </span>
                        )}
                    </button>
                );
            })}
        </div>
    );

    return (
        <div className="space-y-6 relative h-full flex flex-col w-full">
            <div className="flex flex-col gap-4 shrink-0 lg:flex-row lg:items-center lg:justify-between">
                <div className="flex items-center gap-4">
                    <div className="relative">
                        <select
                            value={selectedConfig}
                            onChange={(e) => {
                                const nextConfig = e.target.value;
                                if (isDirty && !window.confirm('You have unsaved changes. Switch configurations and discard them?')) {
                                    return;
                                }
                                setSelectedConfig(nextConfig);
                            }}
                            className="bg-surface border border-border text-text pl-4 pr-10 py-2 rounded-md outline-none focus:ring-1 focus:ring-primary appearance-none min-w-[220px]"
                        >
                            {configs.map((configName) => <option key={configName} value={configName}>{configName}</option>)}
                            <option value="servertest">servertest (Default)</option>
                        </select>
                        <Server className="absolute right-3 top-1/2 -translate-y-1/2 text-text-muted pointer-events-none" size={14} />
                    </div>

                    <div className="flex items-center gap-2">
                        <button onClick={loadConfigs} className="p-2 hover:bg-surface-hover text-text-muted hover:text-text rounded-md transition-colors" title="Refresh Config List">
                            <RefreshCw size={16} />
                        </button>
                        <button
                            onClick={() => window.electronAPI?.revealConfigFile(selectedConfig)}
                            className="p-2 hover:bg-surface-hover text-text-muted hover:text-text rounded-md transition-colors"
                            title="Reveal in File Explorer"
                        >
                            <FolderOpen size={16} />
                        </button>
                        <button
                            onClick={reloadCurrentConfig}
                            className="p-2 hover:bg-surface-hover text-text-muted hover:text-text rounded-md transition-colors"
                            title="Reload from Disk"
                        >
                            <Download size={16} />
                        </button>
                        <button
                            onClick={() => setShowDeleteModal(true)}
                            className="p-2 hover:bg-error/10 text-text-muted hover:text-error rounded-md transition-colors"
                            title="Delete Configuration"
                        >
                            <Trash2 size={16} />
                        </button>
                    </div>
                </div>

                <div className="flex items-center gap-3">
                    <button
                        onClick={() => setShowNewConfigModal(true)}
                        className="flex items-center gap-2 px-4 py-2 bg-surface hover:bg-surface-hover border border-border text-text rounded-md transition-colors text-sm font-medium"
                    >
                        <Plus size={16} />
                        New Config
                    </button>
                    <button
                        onClick={handleSave}
                        disabled={saving || !isDirty}
                        className="flex items-center gap-2 px-4 py-2 bg-primary hover:bg-primary-hover text-white rounded-md transition-colors text-sm font-medium shadow-lg shadow-primary/20 disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                        {saving ? <RefreshCw size={16} className="animate-spin" /> : <Save size={16} />}
                        {saving ? 'Saving...' : isDirty ? 'Save Changes' : 'Saved'}
                    </button>
                </div>
            </div>

            <div className="bg-surface border border-border rounded-lg p-6 flex flex-col flex-1 min-h-0 overflow-hidden shadow-sm">
                <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between mb-6">
                    <div>
                        <h2 className="text-2xl font-bold text-text tracking-tight">{selectedConfig}</h2>
                        <p className="text-sm text-text-muted">
                            {isDirty ? 'Unsaved local changes' : 'In sync with disk'}
                            {copyStatus && <span className="ml-2 font-mono">{copyStatus}</span>}
                        </p>
                    </div>

                    {['general', 'sandbox', 'zombies'].includes(activeTab) && (
                        <div className="relative w-full md:w-80">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-text-muted" size={16} />
                            <input
                                type="text"
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                                placeholder="Filter settings..."
                                className="w-full bg-background border border-border rounded-md pl-10 pr-4 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary"
                            />
                        </div>
                    )}
                </div>

                {renderTabs()}

                {loading ? (
                    <div className="flex-1 flex items-center justify-center text-text-muted">
                        <div className="flex flex-col items-center gap-3">
                            <RefreshCw size={24} className="animate-spin" />
                            <span>Loading configuration...</span>
                        </div>
                    </div>
                ) : (
                    <div className="flex-1 min-h-0 overflow-y-auto pr-2 custom-scrollbar">
                        {activeTab === 'general' && (
                            <div className="space-y-6">
                                <div className="bg-surface-hover/50 border border-border rounded-md p-4">
                                    <div className="flex items-center gap-2 mb-4 text-text">
                                        <Cpu size={18} className="text-primary" />
                                        <h3 className="font-medium">Server Memory (RAM)</h3>
                                    </div>
                                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                                        <div>
                                            <label className="block text-xs text-text-muted font-medium uppercase mb-2">Minimum (GB)</label>
                                            <div className="flex items-center gap-4">
                                                <input
                                                    type="range"
                                                    min="1"
                                                    max="32"
                                                    value={data.metadata?.memory?.min || '4'}
                                                    onChange={(e) => handleMemoryChange('min', e.target.value)}
                                                    className="flex-1 accent-primary h-1.5 bg-border rounded-lg appearance-none cursor-pointer"
                                                />
                                                <span className="w-12 text-right font-mono text-text text-sm">{data.metadata?.memory?.min || '4'} GB</span>
                                            </div>
                                        </div>
                                        <div>
                                            <label className="block text-xs text-text-muted font-medium uppercase mb-2">Maximum (GB)</label>
                                            <div className="flex items-center gap-4">
                                                <input
                                                    type="range"
                                                    min="1"
                                                    max="32"
                                                    value={data.metadata?.memory?.max || '4'}
                                                    onChange={(e) => handleMemoryChange('max', e.target.value)}
                                                    className="flex-1 accent-primary h-1.5 bg-border rounded-lg appearance-none cursor-pointer"
                                                />
                                                <span className="w-12 text-right font-mono text-text text-sm">{data.metadata?.memory?.max || '4'} GB</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                                    {Object.entries(filteredSettings).map(([key, value]) => (
                                        <div key={key} className="flex flex-col gap-1.5">
                                            <label className="text-xs text-text-muted font-medium uppercase tracking-wide">{key}</label>
                                            <ConfigField section="config" settingKey={key} value={value} onChange={handleConfigChange} />
                                        </div>
                                    ))}
                                    {Object.keys(filteredSettings).length === 0 && (
                                        <div className="col-span-full text-center py-12 text-text-muted">
                                            No settings found matching your search.
                                        </div>
                                    )}
                                </div>
                            </div>
                        )}

                        {activeTab === 'mods' && (
                            <div className="space-y-4">
                                <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between bg-surface-hover/50 p-4 border border-border rounded-md">
                                    <div>
                                        <h3 className="font-medium text-text">Enabled Mods</h3>
                                        <p className="text-xs text-text-muted">
                                            {enabledWorkshopIds.size} active workshop item{enabledWorkshopIds.size === 1 ? '' : 's'}
                                        </p>
                                    </div>
                                    <div className="flex flex-wrap gap-2">
                                        <button
                                            onClick={handleCopyMods}
                                            disabled={loading}
                                            className="bg-surface hover:bg-border border border-border text-text px-3 py-1.5 rounded flex items-center gap-2 transition-colors text-sm font-medium disabled:opacity-50"
                                        >
                                            <Copy size={14} className={loading ? 'animate-spin' : ''} />
                                            Copy from Client
                                        </button>
                                        <button
                                            onClick={() => {
                                                setShowAddModModal(true);
                                                if (workshopResults.length === 0) {
                                                    runWorkshopSearch('');
                                                }
                                            }}
                                            className="bg-primary hover:bg-primary-hover text-white px-3 py-1.5 rounded flex items-center gap-2 transition-colors text-sm font-medium shadow-sm"
                                        >
                                            <Plus size={14} />
                                            Add Mod
                                        </button>
                                    </div>
                                </div>

                                <div className="grid grid-cols-1 gap-2">
                                    {getEnabledWorkshopIds().map((id) => {
                                        const mod = installedMods.find((entry) => entry.workshopId === id);
                                        return (
                                            <div key={id} className="flex items-center gap-4 bg-background p-3 border border-border rounded-md hover:border-primary/50 transition-colors group">
                                                {mod?.preview ? (
                                                    <img
                                                        src={mod.preview?.startsWith('http') ? mod.preview : `media://${mod.preview}`}
                                                        alt={mod.title}
                                                        className="w-10 h-10 object-cover rounded border border-border"
                                                    />
                                                ) : (
                                                    <div className="w-10 h-10 bg-surface border border-border rounded flex items-center justify-center text-text-muted">
                                                        <Box size={20} />
                                                    </div>
                                                )}
                                                <div className="flex-1 min-w-0">
                                                    <h4 className="font-medium text-text truncate">{mod?.title || `Workshop Item ${id}`}</h4>
                                                    <div className="flex items-center gap-2 text-xs text-text-muted">
                                                        <span className="bg-surface px-1.5 py-0.5 rounded border border-border font-mono">ID: {id}</span>
                                                        {mod?.mods?.length > 0 && (
                                                            <span className="truncate">Includes: {mod.mods.map((entry) => entry.name).join(', ')}</span>
                                                        )}
                                                    </div>
                                                </div>
                                                <button
                                                    onClick={() => handleRemoveMod(id)}
                                                    disabled={busyModId === id}
                                                    className="p-2 text-text-muted hover:text-error hover:bg-error/10 rounded-full transition-colors disabled:opacity-50"
                                                    title="Remove Mod"
                                                >
                                                    {busyModId === id ? <RefreshCw size={16} className="animate-spin" /> : <Trash2 size={16} />}
                                                </button>
                                            </div>
                                        );
                                    })}

                                    {enabledWorkshopIds.size === 0 && (
                                        <div className="text-center py-12 text-text-muted bg-surface-hover/30 border border-dashed border-border rounded-md">
                                            <Box size={32} className="mx-auto mb-3 opacity-50" />
                                            <p className="font-medium">No mods enabled</p>
                                            <p className="text-xs mt-1">Click Add Mod to browse local or Steam Workshop items.</p>
                                        </div>
                                    )}
                                </div>
                            </div>
                        )}

                        {activeTab === 'sandbox' && (
                            <div className="space-y-6">
                                <div className="bg-surface-hover/50 border border-border rounded-md p-4">
                                    <h3 className="text-sm font-medium text-text mb-3">Quick Presets</h3>
                                    <div className="flex flex-wrap gap-2">
                                        {Object.entries(PRESETS).map(([key, preset]) => (
                                            <button
                                                key={key}
                                                onClick={() => handleApplyPreset(key)}
                                                className="px-3 py-1.5 bg-surface hover:bg-border border border-border rounded text-sm text-text transition-colors"
                                            >
                                                {preset.label}
                                            </button>
                                        ))}
                                    </div>
                                </div>

                                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                                    {Object.entries(filteredSettings).map(([key, value]) => (
                                        <div key={key} className="flex flex-col gap-1.5">
                                            <label className="text-xs text-text-muted font-medium uppercase tracking-wide">{key}</label>
                                            <ConfigField section="sandbox" settingKey={key} value={value} onChange={handleConfigChange} />
                                        </div>
                                    ))}
                                </div>
                            </div>
                        )}

                        {activeTab === 'zombies' && (
                            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                                {Object.entries(filteredSettings).map(([key, value]) => (
                                    <div key={key} className="flex flex-col gap-1.5">
                                        <label className="text-xs text-text-muted font-medium uppercase tracking-wide">{key}</label>
                                        <ConfigField section="zombies" settingKey={key} value={value} onChange={handleConfigChange} />
                                    </div>
                                ))}
                                {Object.keys(filteredSettings).length === 0 && (
                                    <div className="col-span-full text-center py-12 text-text-muted">
                                        No zombie settings found. Run the server once to generate defaults.
                                    </div>
                                )}
                            </div>
                        )}

                        {activeTab === 'spawns' && (
                            <div className="space-y-3">
                                <h3 className="font-medium text-text">Spawn Region Script</h3>
                                <textarea
                                    value={data.spawnregions || ''}
                                    onChange={(e) => handleSpawnRegionsChange(e.target.value)}
                                    className="w-full min-h-[420px] bg-background border border-border rounded-md p-4 text-sm text-text font-mono focus:outline-none focus:ring-1 focus:ring-primary"
                                />
                            </div>
                        )}

                        {activeTab === 'saves' && (
                            <div className="space-y-4">
                                <div className="bg-surface-hover/50 border border-border rounded-md p-4">
                                    <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
                                        <div>
                                            <h3 className="font-medium text-text">Save and Folder Utilities</h3>
                                            <p className="text-sm text-text-muted">Open folders or create a backup of all multiplayer saves.</p>
                                        </div>
                                        <div className="flex flex-wrap gap-2">
                                            <button
                                                onClick={() => window.electronAPI?.openConfigFolder()}
                                                className="flex items-center gap-2 px-4 py-2 bg-surface hover:bg-border border border-border text-text rounded-md transition-colors text-sm font-medium"
                                            >
                                                <FolderOpen size={16} />
                                                Open Config Folder
                                            </button>
                                            <button
                                                onClick={() => window.electronAPI?.openSavesFolder()}
                                                className="flex items-center gap-2 px-4 py-2 bg-surface hover:bg-border border border-border text-text rounded-md transition-colors text-sm font-medium"
                                            >
                                                <FolderOpen size={16} />
                                                Open Saves Folder
                                            </button>
                                            <button
                                                onClick={() => {
                                                    if (!window.electronAPI) {
                                                        return;
                                                    }

                                                    setConfirmation({
                                                        isOpen: true,
                                                        title: 'Backup Saves?',
                                                        message: 'Create a backup of all multiplayer saves?',
                                                        confirmText: 'Backup',
                                                        confirmColor: 'bg-success',
                                                        onConfirm: async () => {
                                                            const result = await window.electronAPI.backupSaves();
                                                            if (result.success) {
                                                                toast.success(`Backup created successfully at:\n${result.path}`);
                                                            } else {
                                                                toast.error(`Backup failed: ${result.error}`);
                                                            }
                                                        }
                                                    });
                                                }}
                                                className="flex items-center gap-2 px-4 py-2 bg-success/10 hover:bg-success/20 border border-success/20 text-success rounded-md transition-colors text-sm font-medium"
                                            >
                                                <Save size={16} />
                                                Backup Saves
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        )}
                    </div>
                )}
            </div>

            <AnimatePresence>
                {showAddModModal && (
                    <motion.div
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        className="absolute inset-0 bg-black/60 flex items-center justify-center z-50 backdrop-blur-sm p-8"
                    >
                        <motion.div
                            initial={{ scale: 0.95, opacity: 0, y: 20 }}
                            animate={{ scale: 1, opacity: 1, y: 0 }}
                            exit={{ scale: 0.95, opacity: 0, y: 20 }}
                            className="bg-surface rounded-lg border border-border w-full max-w-4xl flex flex-col max-h-full shadow-2xl relative overflow-hidden"
                        >
                            <div className="p-4 border-b border-border flex justify-between items-center bg-surface-hover/50">
                                <div>
                                    <h3 className="text-lg font-bold text-text">Add Modification</h3>
                                    <p className="text-xs text-text-muted mt-1">Browse installed workshop content or search Steam Workshop.</p>
                                </div>
                                <button onClick={() => setShowAddModModal(false)} className="text-text-muted hover:text-text transition-colors">
                                    <X size={20} />
                                </button>
                            </div>

                            <div className="p-4 border-b border-border bg-background flex flex-wrap items-center gap-3">
                                <button onClick={() => setModPickerSource('installed')} className={tabClassName(modPickerSource === 'installed')}>
                                    Installed Mods
                                </button>
                                <button onClick={() => setModPickerSource('workshop')} className={tabClassName(modPickerSource === 'workshop')}>
                                    Workshop Browser
                                </button>
                            </div>

                            {modPickerSource === 'installed' ? (
                                <>
                                    <div className="p-4 border-b border-border bg-background">
                                        <div className="relative">
                                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-text-muted" size={16} />
                                            <input
                                                type="text"
                                                value={modSearchTerm}
                                                onChange={(e) => setModSearchTerm(e.target.value)}
                                                placeholder="Search installed mods..."
                                                className="w-full bg-surface border border-border rounded-md pl-10 pr-4 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary"
                                                autoFocus
                                            />
                                        </div>
                                    </div>
                                    <div className="flex-1 overflow-y-auto p-2 custom-scrollbar bg-background">
                                        <div className="grid grid-cols-1 gap-2">
                                            {filteredInstalledMods.map((mod, index) => (
                                                <motion.div
                                                    initial={{ opacity: 0, y: 10 }}
                                                    animate={{ opacity: 1, y: 0 }}
                                                    transition={{ delay: index * 0.03 }}
                                                    key={mod.workshopId}
                                                    className="flex items-center gap-4 p-3 hover:bg-surface-hover rounded-md transition-colors border border-transparent hover:border-border"
                                                >
                                                    {mod.preview ? (
                                                        <img
                                                            src={mod.preview?.startsWith('http') ? mod.preview : `media://${mod.preview}`}
                                                            alt={mod.title}
                                                            className="w-12 h-12 object-cover rounded border border-border"
                                                        />
                                                    ) : (
                                                        <div className="w-12 h-12 bg-surface border border-border rounded flex items-center justify-center text-text-muted">
                                                            <Box size={24} />
                                                        </div>
                                                    )}
                                                    <div className="flex-1 min-w-0">
                                                        <h4 className="font-medium text-text truncate">{mod.title}</h4>
                                                        <div className="flex items-center gap-2 text-xs text-text-muted">
                                                            <span className="bg-surface px-1.5 py-0.5 rounded border border-border font-mono">ID: {mod.workshopId}</span>
                                                            {enabledWorkshopIds.has(mod.workshopId) && (
                                                                <span className="text-success flex items-center gap-1"><Check size={12} /> Added</span>
                                                            )}
                                                        </div>
                                                    </div>
                                                    <button
                                                        onClick={() => handleAddInstalledMod(mod)}
                                                        disabled={busyModId === mod.workshopId || enabledWorkshopIds.has(mod.workshopId)}
                                                        className="p-2 bg-surface hover:bg-primary hover:text-white text-text-muted rounded-full transition-colors shadow-sm disabled:opacity-50"
                                                    >
                                                        {busyModId === mod.workshopId ? <RefreshCw size={16} className="animate-spin" /> : <Plus size={16} />}
                                                    </button>
                                                </motion.div>
                                            ))}

                                            {filteredInstalledMods.length === 0 && (
                                                <div className="text-center py-12 text-text-muted">
                                                    <Box size={32} className="mx-auto mb-3 opacity-50" />
                                                    <p>No installed mods found.</p>
                                                </div>
                                            )}
                                        </div>
                                    </div>
                                </>
                            ) : (
                                <>
                                    <form
                                        onSubmit={(e) => {
                                            e.preventDefault();
                                            runWorkshopSearch(workshopQuery);
                                        }}
                                        className="p-4 border-b border-border bg-background flex gap-3"
                                    >
                                        <div className="relative flex-1">
                                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-text-muted" size={16} />
                                            <input
                                                type="text"
                                                value={workshopQuery}
                                                onChange={(e) => setWorkshopQuery(e.target.value)}
                                                placeholder="Search Steam Workshop or leave empty for trending..."
                                                className="w-full bg-surface border border-border rounded-md pl-10 pr-4 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary"
                                                autoFocus
                                            />
                                        </div>
                                        <button
                                            type="submit"
                                            disabled={workshopLoading}
                                            className="px-4 py-2 bg-primary text-white rounded-md hover:bg-primary-hover transition-colors disabled:opacity-50"
                                        >
                                            {workshopLoading ? 'Searching...' : 'Search'}
                                        </button>
                                    </form>
                                    <div className="flex-1 overflow-y-auto p-2 custom-scrollbar bg-background">
                                        {workshopLoading ? (
                                            <div className="flex flex-col items-center justify-center h-48 text-text-muted gap-3">
                                                <RefreshCw size={24} className="animate-spin text-primary" />
                                                <span className="font-medium animate-pulse">Loading Steam Workshop results...</span>
                                            </div>
                                        ) : (
                                            <div className="grid grid-cols-1 gap-2">
                                                {workshopResults.map((result) => {
                                                    const enabled = enabledWorkshopIds.has(result.workshopId);
                                                    const busy = busyModId === result.workshopId;
                                                    return (
                                                        <div key={result.workshopId} className="flex items-center gap-4 p-3 hover:bg-surface-hover rounded-md transition-colors border border-transparent hover:border-border">
                                                            {result.preview ? (
                                                                <img src={result.preview} alt={result.title} className="w-12 h-12 object-cover rounded border border-border" />
                                                            ) : (
                                                                <div className="w-12 h-12 bg-surface border border-border rounded flex items-center justify-center text-text-muted">
                                                                    <Box size={24} />
                                                                </div>
                                                            )}
                                                            <div className="flex-1 min-w-0">
                                                                <h4 className="font-medium text-text truncate">{result.title}</h4>
                                                                <div className="flex items-center gap-2 text-xs text-text-muted">
                                                                    <span className="bg-surface px-1.5 py-0.5 rounded border border-border font-mono">ID: {result.workshopId}</span>
                                                                    {result.author && <span className="truncate">by {result.author}</span>}
                                                                    {enabled ? (
                                                                        <span className="text-success flex items-center gap-1"><Check size={12} /> Added</span>
                                                                    ) : result.installed ? (
                                                                        <span className="text-success flex items-center gap-1"><Check size={12} /> Installed</span>
                                                                    ) : null}
                                                                </div>
                                                            </div>
                                                            <a
                                                                href={`https://steamcommunity.com/sharedfiles/filedetails/?id=${result.workshopId}`}
                                                                target="_blank"
                                                                rel="noopener noreferrer"
                                                                className="p-2 text-text-muted hover:text-text transition-colors"
                                                                title="View on Steam Workshop"
                                                            >
                                                                <ExternalLink size={16} />
                                                            </a>
                                                            <button
                                                                onClick={() => handleInstallAndAddWorkshopMod(result)}
                                                                disabled={enabled || busy}
                                                                className="px-3 py-2 bg-primary hover:bg-primary-hover text-white rounded-md text-sm font-medium transition-colors disabled:opacity-50"
                                                            >
                                                                {busy
                                                                    ? 'Working...'
                                                                    : enabled
                                                                        ? 'Added'
                                                                        : result.installed
                                                                            ? 'Add to Config'
                                                                            : 'Install and Add'}
                                                            </button>
                                                        </div>
                                                    );
                                                })}

                                                {workshopResults.length === 0 && (
                                                    <div className="text-center py-12 text-text-muted">
                                                        <Box size={32} className="mx-auto mb-3 opacity-50" />
                                                        <p>No workshop results available.</p>
                                                    </div>
                                                )}
                                            </div>
                                        )}
                                    </div>
                                </>
                            )}
                        </motion.div>
                    </motion.div>
                )}

                {showNewConfigModal && (
                    <motion.div
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        className="absolute inset-0 bg-black/60 flex items-center justify-center z-50 backdrop-blur-sm"
                    >
                        <motion.div
                            initial={{ scale: 0.9, opacity: 0 }}
                            animate={{ scale: 1, opacity: 1 }}
                            exit={{ scale: 0.9, opacity: 0 }}
                            className="bg-surface rounded-lg border border-border p-6 w-96 shadow-2xl"
                        >
                            <h3 className="text-lg font-bold text-text mb-4">Create New Configuration</h3>
                            <div className="space-y-4">
                                <div>
                                    <label className="block text-xs text-text-muted font-medium uppercase mb-1">Config Name</label>
                                    <input
                                        type="text"
                                        value={newConfigName}
                                        onChange={(e) => setNewConfigName(e.target.value)}
                                        className="w-full bg-background border border-border rounded px-3 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary"
                                        placeholder="e.g. MySurvivalServer"
                                        autoFocus
                                    />
                                </div>
                                <div className="flex justify-end gap-2">
                                    <button
                                        onClick={() => setShowNewConfigModal(false)}
                                        className="px-4 py-2 text-sm text-text-muted hover:text-text hover:bg-surface-hover rounded transition-colors"
                                    >
                                        Cancel
                                    </button>
                                    <button
                                        onClick={handleCreateConfig}
                                        disabled={!newConfigName}
                                        className="px-4 py-2 text-sm bg-primary hover:bg-primary-hover text-white rounded transition-colors disabled:opacity-50 font-medium shadow-lg shadow-primary/20"
                                    >
                                        Create Config
                                    </button>
                                </div>
                            </div>
                        </motion.div>
                    </motion.div>
                )}

                {showDeleteModal && (
                    <motion.div
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        className="absolute inset-0 bg-black/60 flex items-center justify-center z-50 backdrop-blur-sm"
                    >
                        <motion.div
                            initial={{ scale: 0.9, opacity: 0 }}
                            animate={{ scale: 1, opacity: 1 }}
                            exit={{ scale: 0.9, opacity: 0 }}
                            className="bg-surface rounded-lg border border-border p-6 w-96 shadow-2xl border-error/20"
                        >
                            <div className="flex items-center gap-3 mb-4 text-error">
                                <AlertCircle size={24} />
                                <h3 className="text-lg font-bold">Delete Configuration?</h3>
                            </div>
                            <p className="text-sm text-text-muted mb-6">
                                Are you sure you want to delete <span className="text-text font-medium">"{selectedConfig}"</span>?
                                This action cannot be undone.
                            </p>

                            <div className="mb-6">
                                <label className="flex items-center gap-2 cursor-pointer group">
                                    <input
                                        type="checkbox"
                                        checked={deleteWorldData}
                                        onChange={(e) => setDeleteWorldData(e.target.checked)}
                                        className="w-4 h-4 rounded border-border bg-background text-error focus:ring-error"
                                    />
                                    <span className="text-sm text-text-muted group-hover:text-text transition-colors">Also delete world save data</span>
                                </label>
                            </div>

                            <div className="flex justify-end gap-2">
                                <button
                                    onClick={() => setShowDeleteModal(false)}
                                    className="px-4 py-2 text-sm text-text-muted hover:text-text hover:bg-surface-hover rounded transition-colors"
                                >
                                    Cancel
                                </button>
                                <button
                                    onClick={handleDeleteConfig}
                                    className="px-4 py-2 text-sm bg-error hover:bg-red-600 text-white rounded transition-colors font-medium shadow-lg shadow-error/20"
                                >
                                    Delete Forever
                                </button>
                            </div>
                        </motion.div>
                    </motion.div>
                )}
            </AnimatePresence>

            <ConfirmationModal
                isOpen={confirmation.isOpen}
                onClose={() => setConfirmation((prev) => ({ ...prev, isOpen: false }))}
                onConfirm={confirmation.onConfirm}
                title={confirmation.title}
                message={confirmation.message}
                confirmText={confirmation.confirmText}
                confirmColor={confirmation.confirmColor}
            />
        </div>
    );
};

export default Configuration;
