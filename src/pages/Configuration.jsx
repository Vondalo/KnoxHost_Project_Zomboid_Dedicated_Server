import React, { useState, useEffect, useMemo } from 'react';
import { Save, RefreshCw, Plus, Trash2, Search, Settings, X, FileText, FolderOpen, Box, Layers, Cpu, Check, MapPin, Skull, Download, Copy, AlertCircle } from 'lucide-react';
import { PRESETS } from '../data/presets';
import { motion, AnimatePresence } from 'framer-motion';
import clsx from 'clsx';

const Configuration = () => {
    // Global State
    const [configs, setConfigs] = useState([]);
    const [selectedConfig, setSelectedConfig] = useState(() => localStorage.getItem('lastSelectedConfig') || 'servertest');
    const [data, setData] = useState({ config: {}, sandbox: {}, spawnregions: '', zombies: {}, metadata: { memory: { min: '4', max: '4' } } });
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');
    const [activeTab, setActiveTab] = useState('general');

    // Modals
    const [showAddModModal, setShowAddModModal] = useState(false);
    const [showNewConfigModal, setShowNewConfigModal] = useState(false);
    const [showDeleteModal, setShowDeleteModal] = useState(false);
    const [deleteWorldData, setDeleteWorldData] = useState(false);
    const [newConfigName, setNewConfigName] = useState('');

    // Mods State
    const [installedMods, setInstalledMods] = useState([]);
    const [copyStatus, setCopyStatus] = useState('');

    // --- Initialization ---

    useEffect(() => {
        loadConfigs();
        fetchMods();
    }, []);

    useEffect(() => {
        if (selectedConfig) {
            loadData(selectedConfig);
            localStorage.setItem('lastSelectedConfig', selectedConfig);
        }
    }, [selectedConfig]);

    const loadConfigs = async () => {
        if (window.electronAPI) {
            const list = await window.electronAPI.getConfigs();
            setConfigs(list);
            if (!list.includes(selectedConfig) && list.length > 0) {
                setSelectedConfig(list[0]);
            }
        }
    };

    const fetchMods = async () => {
        if (window.electronAPI) {
            const mods = await window.electronAPI.getMods();
            setInstalledMods(mods);
        }
    };

    const loadData = async (name) => {
        setLoading(true);
        if (window.electronAPI) {
            try {
                const result = await window.electronAPI.readConfig(name);
                setData(result);
            } catch (error) {
                console.error("Failed to load config:", error);
            }
        }
        setLoading(false);
    };

    // --- Handlers ---

    const handleCreateConfig = async () => {
        if (!newConfigName) return;

        if (!/^[a-zA-Z0-9_-]+$/.test(newConfigName)) {
            alert("Config name can only contain letters, numbers, underscores, and hyphens.");
            return;
        }

        if (configs.includes(newConfigName)) {
            alert("Config name already exists!");
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
            metadata: { memory: { min: '4', max: '4' } }
        };

        if (window.electronAPI) {
            await window.electronAPI.saveConfig(newConfigName, newData);
            await loadConfigs();
            setSelectedConfig(newConfigName);
            setShowNewConfigModal(false);
            setNewConfigName('');
        }
    };

    const handleDeleteConfig = async () => {
        if (!window.electronAPI) return;

        const success = await window.electronAPI.deleteConfig(selectedConfig, deleteWorldData);
        if (success) {
            await loadConfigs();
            setShowDeleteModal(false);
            setDeleteWorldData(false);
            const remaining = configs.filter(c => c !== selectedConfig);
            if (remaining.length > 0) setSelectedConfig(remaining[0]);
            else setSelectedConfig('servertest');
        } else {
            alert("Failed to delete configuration.");
        }
    };

    const handleSave = async () => {
        if (window.electronAPI) {
            await window.electronAPI.saveConfig(selectedConfig, data);
            alert('Configuration saved successfully!');
        }
    };

    const handleConfigChange = (section, key, value) => {
        setData(prev => {
            const newData = { ...prev };
            const sectionData = { ...newData[section] };

            if (key.includes('.')) {
                const parts = key.split('.');
                let current = sectionData;
                for (let i = 0; i < parts.length - 1; i++) {
                    if (!current[parts[i]]) current[parts[i]] = {};
                    current[parts[i]] = { ...current[parts[i]] };
                    current = current[parts[i]];
                }
                current[parts[parts.length - 1]] = value;
            } else {
                sectionData[key] = value;
            }

            newData[section] = sectionData;
            return newData;
        });
    };

    const handleSpawnRegionsChange = (value) => {
        setData(prev => ({
            ...prev,
            spawnregions: value
        }));
    };

    const flattenObject = (obj, prefix = '') => {
        return Object.keys(obj).reduce((acc, k) => {
            const pre = prefix.length ? prefix + '.' : '';
            if (typeof obj[k] === 'object' && obj[k] !== null && !Array.isArray(obj[k])) {
                Object.assign(acc, flattenObject(obj[k], pre + k));
            } else {
                acc[pre + k] = obj[k];
            }
            return acc;
        }, {});
    };

    const ConfigField = ({ section, settingKey, value }) => {
        const type = typeof value;

        if (typeof settingKey === 'string' && settingKey.toLowerCase().includes('password')) {
            return (
                <input
                    type="password"
                    value={value}
                    onChange={(e) => handleConfigChange(section, settingKey, e.target.value)}
                    className="w-full bg-background border border-border rounded px-3 py-1.5 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary transition-all font-mono"
                />
            );
        }

        if (type === 'boolean') {
            return (
                <button
                    onClick={() => handleConfigChange(section, settingKey, !value)}
                    className={clsx(
                        "w-10 h-5 rounded-full transition-colors relative focus:outline-none focus:ring-1 focus:ring-primary",
                        value ? 'bg-primary' : 'bg-surface-hover'
                    )}
                >
                    <motion.div
                        className="absolute top-1 left-1 w-3 h-3 rounded-full bg-white"
                        animate={{ x: value ? 20 : 0 }}
                        transition={{ type: "spring", stiffness: 500, damping: 30 }}
                    />
                </button>
            );
        }

        if (type === 'number') {
            return (
                <input
                    type="number"
                    value={value}
                    onChange={(e) => handleConfigChange(section, settingKey, parseFloat(e.target.value))}
                    className="w-full bg-background border border-border rounded px-3 py-1.5 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary transition-all font-mono"
                />
            );
        }

        return (
            <input
                type="text"
                value={value}
                onChange={(e) => handleConfigChange(section, settingKey, e.target.value)}
                className="w-full bg-background border border-border rounded px-3 py-1.5 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary transition-all font-mono"
            />
        );
    };

    const getEnabledWorkshopIds = () => {
        const items = data.config?.WorkshopItems || '';
        if (!items) return [];
        return items.split(';').filter(id => id.trim().length > 0);
    };

    const handleAddMod = async (mod) => {
        if (!window.electronAPI) return;

        const currentItems = getEnabledWorkshopIds();
        if (currentItems.includes(mod.workshopId)) return;

        const newItems = [...currentItems, mod.workshopId].join(';');
        const currentMods = data.config?.Mods ? data.config.Mods.split(';') : [];
        const modNames = mod.mods.map(m => m.name);
        const newMods = [...new Set([...currentMods, ...modNames])].filter(Boolean).join(';');

        const result = await window.electronAPI.addMod(selectedConfig, mod.workshopId, modNames);

        if (result.mapsAdded === 0 && mod.tags.includes("Map")) {
            alert(`Warning: Added mod "${mod.title}" but no map folders were found.`);
        }

        handleConfigChange('config', 'WorkshopItems', newItems);
        handleConfigChange('config', 'Mods', newMods);
    };

    const handleRemoveMod = async (workshopId) => {
        if (!window.electronAPI) return;

        const currentItems = getEnabledWorkshopIds();
        const newItems = currentItems.filter(id => id !== workshopId).join(';');

        const mod = installedMods.find(m => m.workshopId === workshopId);
        let newMods = data.config?.Mods || '';

        if (mod) {
            const namesToRemove = mod.mods.map(m => m.name);
            const currentMods = newMods.split(';');
            newMods = currentMods.filter(name => !namesToRemove.includes(name)).join(';');
        }

        handleConfigChange('config', 'WorkshopItems', newItems);
        handleConfigChange('config', 'Mods', newMods);
    };

    const handleCopyMods = async () => {
        if (!window.electronAPI) return;
        setLoading(true);
        setCopyStatus('Analyzing client mods...');

        try {
            const ids = getEnabledWorkshopIds();
            if (ids.length === 0) {
                alert("No mods enabled in configuration to copy.");
                setLoading(false);
                setCopyStatus('');
                return;
            }

            setCopyStatus(`Copying ${ids.length} mods...`);
            const result = await window.electronAPI.copyModsFromClient(ids);

            if (result.success) {
                alert(`Successfully copied ${result.count} mods to server folder.`);
            } else {
                alert(`Error copying mods: ${result.error}`);
            }
        } catch (error) {
            console.error(error);
            alert("Failed to copy mods.");
        } finally {
            setLoading(false);
            setCopyStatus('');
        }
    };

    const handleApplyPreset = (presetKey) => {
        const preset = PRESETS[presetKey];
        if (!preset) return;
        if (!confirm(`Apply preset "${preset.label}"? This will overwrite current Sandbox settings.`)) return;

        setData(prev => {
            const newSandbox = JSON.parse(JSON.stringify(prev.sandbox || {}));
            const merge = (target, source) => {
                for (const key in source) {
                    if (source[key] instanceof Object && !Array.isArray(source[key])) {
                        if (!target[key]) Object.assign(target, { [key]: {} });
                        merge(target[key], source[key]);
                    } else {
                        Object.assign(target, { [key]: source[key] });
                    }
                }
            };
            merge(newSandbox, preset.data);
            return { ...prev, sandbox: newSandbox };
        });
        alert(`Preset "${preset.label}" applied! Don't forget to save.`);
    };

    const handleInstallSophie = async () => {
        if (!window.electronAPI) return;
        if (!confirm("Install Sophie Modpack files? This will copy files to your Zomboid directory.")) return;

        setLoading(true);
        try {
            const result = await window.electronAPI.installSophiePreset();
            if (result.success) {
                alert(result.message);
                await loadConfigs();
                setSelectedConfig('server-sophie-1-14');
            } else {
                alert(`Failed to install: ${result.error}`);
            }
        } catch (err) {
            console.error(err);
            alert("Error installing Sophie Modpack.");
        } finally {
            setLoading(false);
        }
    };

    const filteredSettings = useMemo(() => {
        let target;
        if (activeTab === 'sandbox') target = data.sandbox;
        else if (activeTab === 'zombies') target = data.zombies;
        else target = data.config;

        if (!target) return {};

        const flattenedTarget = flattenObject(target);
        const ignoredKeys = ['WorkshopItems', 'Mods', 'Map', 'SpawnPoint'];

        return Object.fromEntries(
            Object.entries(flattenedTarget).filter(([key]) => {
                if (activeTab === 'general' && ignoredKeys.includes(key)) return false;
                if (!searchTerm) return true;
                return key.toLowerCase().includes(searchTerm.toLowerCase());
            })
        );
    }, [data, activeTab, searchTerm]);

    const renderTabs = () => (
        <div className="flex gap-2 border-b border-border mb-6 overflow-x-auto pb-1">
            {[
                { id: 'general', icon: Settings, label: 'General' },
                { id: 'mods', icon: Box, label: 'Mods', count: getEnabledWorkshopIds().length },
                { id: 'sandbox', icon: Layers, label: 'Sandbox' },
                { id: 'zombies', icon: Skull, label: 'Zombies' },
                { id: 'spawns', icon: MapPin, label: 'Spawns' },
                { id: 'saves', icon: FolderOpen, label: 'Saves' }
            ].map(tab => {
                const isActive = activeTab === tab.id;
                return (
                    <button
                        key={tab.id}
                        onClick={() => setActiveTab(tab.id)}
                        className={clsx(
                            "relative px-4 py-2 flex items-center gap-2 rounded-md transition-colors text-sm font-medium whitespace-nowrap z-10",
                            isActive ? "text-white" : "text-text-muted hover:text-text"
                        )}
                    >
                        {isActive && (
                            <motion.div
                                layoutId="activeTab"
                                className="absolute inset-0 bg-surface-hover border border-border rounded-md shadow-sm -z-10"
                                transition={{ type: "spring", bounce: 0.2, duration: 0.6 }}
                            />
                        )}
                        <tab.icon size={16} className={clsx("transition-colors", isActive ? "text-primary" : "text-text-muted")} />
                        {tab.label}
                        {tab.count !== undefined && (
                            <span className={clsx(
                                "text-xs px-1.5 py-0.5 rounded-full transition-colors",
                                isActive ? "bg-primary text-white" : "bg-border text-text-muted"
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
            {/* Header */}
            <div className="flex items-center justify-between shrink-0">
                <div className="flex items-center gap-4">
                    <div className="relative">
                        <select
                            value={selectedConfig}
                            onChange={(e) => setSelectedConfig(e.target.value)}
                            className="bg-surface border border-border text-text pl-4 pr-10 py-2 rounded-md outline-none focus:ring-1 focus:ring-primary appearance-none min-w-[200px]"
                        >
                            {configs.map(c => <option key={c} value={c}>{c}</option>)}
                            <option value="servertest">servertest (Default)</option>
                        </select>
                        <Settings className="absolute right-3 top-1/2 -translate-y-1/2 text-text-muted pointer-events-none" size={14} />
                    </div>

                    <div className="flex items-center gap-2">
                        <button onClick={loadConfigs} className="p-2 hover:bg-surface-hover text-text-muted hover:text-text rounded-md transition-colors" title="Refresh List">
                            <RefreshCw size={16} />
                        </button>
                        <button
                            onClick={() => window.electronAPI?.revealConfigFile(selectedConfig)}
                            className="p-2 hover:bg-surface-hover text-text-muted hover:text-text rounded-md transition-colors"
                            title="Reveal in File Explorer"
                        >
                            <FolderOpen size={16} />
                        </button>
                        <button onClick={() => setShowDeleteModal(true)} className="p-2 hover:bg-error/10 text-text-muted hover:text-error rounded-md transition-colors" title="Delete Config">
                            <Trash2 size={16} />
                        </button>
                    </div>
                </div>

                <div className="flex gap-3">
                    <button
                        onClick={() => setShowNewConfigModal(true)}
                        className="flex items-center gap-2 px-4 py-2 bg-surface-hover hover:bg-border border border-border text-text rounded-md transition-colors text-sm font-medium"
                    >
                        <Plus size={16} />
                        New Config
                    </button>
                    <button
                        onClick={handleInstallSophie}
                        className="flex items-center gap-2 px-4 py-2 bg-purple-500/10 hover:bg-purple-500/20 border border-purple-500/20 text-purple-400 rounded-md transition-colors text-sm font-medium"
                        title="Install Sophie Modpack Files"
                    >
                        <Download size={16} />
                        Sophie Mode
                    </button>
                    <button
                        onClick={handleSave}
                        className="flex items-center gap-2 px-4 py-2 bg-primary hover:bg-primary-hover text-white rounded-md transition-colors text-sm font-medium shadow-lg shadow-primary/20"
                    >
                        <Save size={16} />
                        Save Changes
                    </button>
                </div>
            </div>

            {/* Main Content Area */}
            <div className="bg-surface border border-border rounded-lg p-6 flex flex-col flex-1 min-h-0 overflow-hidden shadow-sm">
                {renderTabs()}

                {loading ? (
                    <div className="flex-1 flex flex-col items-center justify-center text-text-muted animate-pulse gap-2">
                        <RefreshCw size={24} className="animate-spin" />
                        <span>Loading configuration...</span>
                        {copyStatus && <span className="text-sm font-mono text-text">{copyStatus}</span>}
                    </div>
                ) : (
                    <div className="flex-1 overflow-y-auto pr-2 custom-scrollbar">
                        {/* Search Bar for Settings */}
                        {(activeTab === 'general' || activeTab === 'sandbox' || activeTab === 'zombies') && (
                            <div className="mb-6 relative">
                                <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-text-muted" size={16} />
                                <input
                                    type="text"
                                    placeholder="Search settings..."
                                    value={searchTerm}
                                    onChange={(e) => setSearchTerm(e.target.value)}
                                    className="w-full bg-background border border-border rounded-md pl-10 pr-4 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary"
                                />
                            </div>
                        )}

                        {/* GENERAL TAB */}
                        {activeTab === 'general' && (
                            <div className="space-y-6">
                                {/* Memory Settings Section */}
                                <div className="bg-surface-hover/50 border border-border rounded-md p-4">
                                    <div className="flex items-center gap-2 mb-4 text-text">
                                        <Cpu size={18} className="text-primary" />
                                        <h3 className="font-medium">Server Memory (RAM)</h3>
                                    </div>
                                    <div className="grid grid-cols-2 gap-6">
                                        <div>
                                            <label className="block text-xs text-text-muted font-medium uppercase mb-2">Minimum (GB)</label>
                                            <div className="flex items-center gap-4">
                                                <input
                                                    type="range"
                                                    min="1"
                                                    max="32"
                                                    value={data.metadata?.memory?.min || '4'}
                                                    onChange={(e) => handleConfigChange('metadata', 'memory', { ...data.metadata.memory, min: e.target.value })}
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
                                                    onChange={(e) => handleConfigChange('metadata', 'memory', { ...data.metadata.memory, max: e.target.value })}
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
                                            <ConfigField section="config" settingKey={key} value={value} />
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

                        {/* SANDBOX TAB */}
                        {activeTab === 'sandbox' && (
                            <div className="space-y-6">
                                <div className="bg-surface-hover/50 border border-border rounded-md p-4 flex items-center justify-between">
                                    <div>
                                        <h3 className="font-medium text-text">Sandbox Settings</h3>
                                        <p className="text-xs text-text-muted">Gameplay configuration and world rules</p>
                                    </div>
                                    <div className="flex items-center gap-3">
                                        <span className="text-xs text-text-muted font-medium uppercase">Apply Preset:</span>
                                        <select
                                            onChange={(e) => {
                                                if (e.target.value) {
                                                    handleApplyPreset(e.target.value);
                                                    e.target.value = "";
                                                }
                                            }}
                                            className="bg-background border border-border text-text px-3 py-1.5 rounded text-sm outline-none focus:ring-1 focus:ring-primary"
                                            defaultValue=""
                                        >
                                            <option value="" disabled>-- Select Preset --</option>
                                            {Object.entries(PRESETS).map(([key, preset]) => (
                                                <option key={key} value={key}>{preset.label}</option>
                                            ))}
                                        </select>
                                    </div>
                                </div>

                                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                                    {Object.entries(filteredSettings).map(([key, value]) => (
                                        <div key={key} className="flex flex-col gap-1.5">
                                            <label className="text-xs text-text-muted font-medium uppercase tracking-wide">{key}</label>
                                            <ConfigField section="sandbox" settingKey={key} value={value} />
                                        </div>
                                    ))}
                                </div>
                            </div>
                        )}

                        {/* ZOMBIES TAB */}
                        {activeTab === 'zombies' && (
                            <div className="space-y-6">
                                <div className="bg-surface-hover/50 border border-border rounded-md p-4">
                                    <h3 className="font-medium text-text">Advanced Zombie Population</h3>
                                    <p className="text-xs text-text-muted">Fine tune population distribution and density</p>
                                </div>

                                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                                    {Object.entries(filteredSettings).map(([key, value]) => (
                                        <div key={key} className="flex flex-col gap-1.5">
                                            <label className="text-xs text-text-muted font-medium uppercase tracking-wide">{key}</label>
                                            <ConfigField section="zombies" settingKey={key} value={value} />
                                        </div>
                                    ))}
                                    {Object.keys(filteredSettings).length === 0 && (
                                        <div className="col-span-full text-center py-12 text-text-muted">
                                            No settings found. Run the server once to generate defaults.
                                        </div>
                                    )}
                                </div>
                            </div>
                        )}

                        {/* SPAWNS TAB */}
                        {activeTab === 'spawns' && (
                            <div className="h-full flex flex-col">
                                <div className="bg-blue-500/10 border border-blue-500/20 rounded-md p-4 mb-4 flex items-start gap-3">
                                    <AlertCircle size={18} className="text-blue-400 shrink-0 mt-0.5" />
                                    <div className="text-sm text-blue-200/80">
                                        <p className="font-medium text-blue-200 mb-1">Editing spawnregions.lua</p>
                                        <p>This file controls where players can spawn. Ensure valid Lua syntax.</p>
                                    </div>
                                </div>
                                <textarea
                                    value={data.spawnregions || ''}
                                    onChange={(e) => handleSpawnRegionsChange(e.target.value)}
                                    className="flex-1 w-full bg-background border border-border rounded-md p-4 font-mono text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary resize-none leading-relaxed"
                                    placeholder="function SpawnRegions() ..."
                                    spellCheck={false}
                                />
                            </div>
                        )}

                        {/* MODS TAB */}
                        {activeTab === 'mods' && (
                            <div className="space-y-4">
                                <div className="flex justify-between items-center bg-surface-hover/50 p-4 border border-border rounded-md">
                                    <div>
                                        <h3 className="font-medium text-text">Enabled Mods</h3>
                                        <p className="text-xs text-text-muted">
                                            {getEnabledWorkshopIds().length} active modifications
                                        </p>
                                    </div>
                                    <div className="flex gap-2">
                                        <button
                                            onClick={handleCopyMods}
                                            disabled={loading}
                                            className="bg-surface hover:bg-border border border-border text-text px-3 py-1.5 rounded flex items-center gap-2 transition-colors text-sm font-medium disabled:opacity-50"
                                        >
                                            <Copy size={14} className={loading ? 'animate-spin' : ''} />
                                            Copy from Client
                                        </button>
                                        <button
                                            onClick={() => setShowAddModModal(true)}
                                            className="bg-primary hover:bg-primary-hover text-white px-3 py-1.5 rounded flex items-center gap-2 transition-colors text-sm font-medium shadow-sm"
                                        >
                                            <Plus size={14} />
                                            Add Mod
                                        </button>
                                    </div>
                                </div>

                                <div className="grid grid-cols-1 gap-2">
                                    {getEnabledWorkshopIds().map(id => {
                                        const mod = installedMods.find(m => m.workshopId === id);
                                        return (
                                            <div key={id} className="flex items-center gap-4 bg-background p-3 border border-border rounded-md hover:border-primary/50 transition-colors group">
                                                {mod?.preview ? (
                                                    <img src={mod.preview?.startsWith('http') ? mod.preview : `media://${mod.preview}`} alt={mod.title} className="w-10 h-10 object-cover rounded border border-border" />
                                                ) : (
                                                    <div className="w-10 h-10 bg-surface border border-border rounded flex items-center justify-center text-text-muted">
                                                        <Box size={20} />
                                                    </div>
                                                )}

                                                <div className="flex-1 min-w-0">
                                                    <h4 className="font-medium truncate text-text group-hover:text-primary transition-colors">{mod?.title || `Unknown Mod (${id})`}</h4>
                                                    <div className="flex items-center gap-2 text-xs text-text-muted">
                                                        <span className="bg-surface px-1.5 py-0.5 rounded border border-border font-mono">ID: {id}</span>
                                                        {mod?.mods?.length > 0 && (
                                                            <span className="truncate">Includes: {mod.mods.map(m => m.name).join(', ')}</span>
                                                        )}
                                                    </div>
                                                </div>

                                                <button
                                                    onClick={() => handleRemoveMod(id)}
                                                    className="p-2 text-text-muted hover:bg-error/10 hover:text-error rounded transition-colors"
                                                    title="Remove Mod"
                                                >
                                                    <Trash2 size={16} />
                                                </button>
                                            </div>
                                        );
                                    })}

                                    {getEnabledWorkshopIds().length === 0 && (
                                        <div className="text-center py-12 text-text-muted bg-surface-hover/30 border border-dashed border-border rounded-md">
                                            <Box size={32} className="mx-auto mb-3 opacity-50" />
                                            <p className="font-medium">No mods enabled</p>
                                            <p className="text-xs mt-1">Click "Add Mod" to browse installed workshop items</p>
                                        </div>
                                    )}
                                </div>
                            </div>
                        )}

                        {/* SAVES TAB */}
                        {activeTab === 'saves' && (
                            <div className="flex flex-col gap-6 items-start">
                                <div className="bg-surface-hover/50 border border-border rounded-md p-6 w-full max-w-2xl">
                                    <h3 className="font-medium text-text text-lg mb-2">Save Management</h3>
                                    <p className="text-sm text-text-muted mb-6">
                                        Manage your server saves. Backups are stored in the app data folder.
                                    </p>

                                    <div className="flex gap-4">
                                        <button
                                            onClick={async () => {
                                                if (window.electronAPI) await window.electronAPI.openSavesFolder();
                                            }}
                                            className="flex items-center gap-2 px-4 py-2 bg-surface hover:bg-border border border-border text-text rounded-md transition-colors text-sm font-medium"
                                        >
                                            <FolderOpen size={16} />
                                            Open Saves Folder
                                        </button>

                                        <button
                                            onClick={async () => {
                                                if (!window.electronAPI) return;
                                                if (!confirm("Create a backup of all multiplayer saves?")) return;
                                                setLoading(true);
                                                try {
                                                    const result = await window.electronAPI.backupSaves();
                                                    if (result.success) {
                                                        alert(`Backup created successfully at:\n${result.path}`);
                                                    } else {
                                                        alert(`Backup failed: ${result.error}`);
                                                    }
                                                } catch (err) {
                                                    console.error(err);
                                                    alert("Backup failed.");
                                                } finally {
                                                    setLoading(false);
                                                }
                                            }}
                                            disabled={loading}
                                            className="flex items-center gap-2 px-4 py-2 bg-success/10 hover:bg-success/20 border border-success/20 text-success rounded-md transition-colors text-sm font-medium disabled:opacity-50"
                                        >
                                            <Save size={16} />
                                            Backup Saves
                                        </button>
                                    </div>
                                </div>
                            </div>
                        )}
                    </div>
                )}
            </div>

            {/* --- MODALS --- */}
            <AnimatePresence>
                {/* Add Mod Modal */}
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
                            className="bg-surface rounded-lg border border-border w-full max-w-2xl flex flex-col max-h-full shadow-2xl relative overflow-hidden"
                        >
                            <div className="p-4 border-b border-border flex justify-between items-center bg-surface-hover/50">
                                <h3 className="text-lg font-bold text-text">Add Modification</h3>
                                <button onClick={() => setShowAddModModal(false)} className="text-text-muted hover:text-text transition-colors">
                                    <X size={20} />
                                </button>
                            </div>
                            <div className="p-4 border-b border-border bg-background">
                                <div className="relative">
                                    <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-text-muted" size={16} />
                                    <input
                                        type="text"
                                        placeholder="Search installed mods..."
                                        className="w-full bg-surface border border-border rounded-md pl-10 pr-4 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary"
                                        autoFocus
                                    />
                                </div>
                            </div>
                            <div className="flex-1 overflow-y-auto p-2 custom-scrollbar bg-background">
                                <div className="grid grid-cols-1 gap-2">
                                    {installedMods.map((mod, i) => (
                                        <motion.div
                                            initial={{ opacity: 0, y: 10 }}
                                            animate={{ opacity: 1, y: 0 }}
                                            transition={{ delay: i * 0.05 }}
                                            key={mod.workshopId}
                                            className="flex items-center gap-4 p-3 hover:bg-surface-hover rounded-md transition-colors border border-transparent hover:border-border cursor-pointer group"
                                            onClick={() => handleAddMod(mod)}
                                        >
                                            {mod.preview ? (
                                                <img src={`file://${mod.preview}`} alt={mod.title} className="w-12 h-12 object-cover rounded border border-border" />
                                            ) : (
                                                <div className="w-12 h-12 bg-surface border border-border rounded flex items-center justify-center text-text-muted">
                                                    <Box size={24} />
                                                </div>
                                            )}
                                            <div className="flex-1 min-w-0">
                                                <h4 className="font-medium text-text truncate group-hover:text-primary transition-colors">{mod.title}</h4>
                                                <div className="flex items-center gap-2 text-xs text-text-muted">
                                                    <span className="bg-surface px-1.5 py-0.5 rounded border border-border font-mono">ID: {mod.workshopId}</span>
                                                    {getEnabledWorkshopIds().includes(mod.workshopId) && (
                                                        <span className="text-success flex items-center gap-1"><Check size={12} /> Added</span>
                                                    )}
                                                </div>
                                            </div>
                                            <button className="p-2 bg-surface hover:bg-primary hover:text-white text-text-muted rounded-full transition-colors shadow-sm">
                                                <Plus size={16} />
                                            </button>
                                        </motion.div>
                                    ))}
                                </div>
                            </div>
                        </motion.div>
                    </motion.div>
                )}

                {/* New Config Modal */}
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

                {/* Delete Modal */}
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

            {/* New Config Modal */}
            {showNewConfigModal && (
                <div className="absolute inset-0 bg-black/60 flex items-center justify-center z-50 backdrop-blur-sm">
                    <div className="bg-surface rounded-lg border border-border p-6 w-full max-w-md shadow-2xl">
                        <h3 className="text-lg font-bold text-text mb-4">Create New Configuration</h3>
                        <input
                            type="text"
                            placeholder="Server Name (e.g. my-survival-server)"
                            value={newConfigName}
                            onChange={(e) => setNewConfigName(e.target.value)}
                            className="w-full bg-background border border-border rounded-md px-4 py-2 text-text focus:outline-none focus:ring-1 focus:ring-primary mb-6"
                            autoFocus
                        />
                        <div className="flex justify-end gap-3">
                            <button
                                onClick={() => setShowNewConfigModal(false)}
                                className="px-4 py-2 text-text-muted hover:text-text transition-colors"
                            >
                                Cancel
                            </button>
                            <button
                                onClick={handleCreateConfig}
                                disabled={!newConfigName}
                                className="px-4 py-2 bg-primary hover:bg-primary-hover text-white rounded-md transition-colors disabled:opacity-50 font-medium"
                            >
                                Create Config
                            </button>
                        </div>
                    </div>
                </div>
            )}

            {/* Delete Config Modal */}
            {showDeleteModal && (
                <div className="absolute inset-0 bg-black/60 flex items-center justify-center z-50 backdrop-blur-sm">
                    <div className="bg-surface rounded-lg border border-border p-6 w-full max-w-md shadow-2xl">
                        <div className="flex items-center gap-3 text-error mb-4">
                            <Trash2 size={24} />
                            <h3 className="text-lg font-bold">Delete Configuration?</h3>
                        </div>
                        <p className="text-text-muted mb-6">
                            Are you sure you want to delete <span className="text-text font-bold">{selectedConfig}</span>?
                            This action cannot be undone.
                        </p>

                        <label className="flex items-center gap-3 mb-6 cursor-pointer group">
                            <div className={clsx(
                                "w-5 h-5 rounded border flex items-center justify-center transition-colors",
                                deleteWorldData ? "bg-error border-error text-white" : "bg-background border-border group-hover:border-text-muted"
                            )}>
                                {deleteWorldData && <Check size={14} />}
                            </div>
                            <input
                                type="checkbox"
                                checked={deleteWorldData}
                                onChange={(e) => setDeleteWorldData(e.target.checked)}
                                className="hidden"
                            />
                            <span className="text-sm text-text">Also delete world save data</span>
                        </label>

                        <div className="flex justify-end gap-3">
                            <button
                                onClick={() => setShowDeleteModal(false)}
                                className="px-4 py-2 text-text-muted hover:text-text transition-colors"
                            >
                                Cancel
                            </button>
                            <button
                                onClick={handleDeleteConfig}
                                className="px-4 py-2 bg-error hover:bg-error/90 text-white rounded-md transition-colors font-medium"
                            >
                                Delete Forever
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
};

export default Configuration;
