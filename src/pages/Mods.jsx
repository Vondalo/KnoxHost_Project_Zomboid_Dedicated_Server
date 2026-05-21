import React, { useEffect, useMemo, useState } from 'react';
import { Search, RefreshCw, Box, Check, ExternalLink, ChevronLeft, ChevronRight, Download, Plus, Server } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import clsx from 'clsx';
import { useToast } from '../context/ToastContext';

const ITEMS_PER_PAGE = 12;

const tabClassName = (active) => clsx(
    'px-4 py-2 rounded-md text-sm font-medium transition-colors border',
    active
        ? 'bg-primary/10 text-primary border-primary/20'
        : 'bg-surface text-text-muted border-border hover:text-text hover:bg-surface-hover'
);

const Mods = () => {
    const toast = useToast();
    const [configs, setConfigs] = useState([]);
    const [selectedConfig, setSelectedConfig] = useState(() => localStorage.getItem('lastSelectedConfig') || 'servertest');
    const [configData, setConfigData] = useState(null);
    const [installedMods, setInstalledMods] = useState([]);
    const [workshopResults, setWorkshopResults] = useState([]);
    const [installedLoading, setInstalledLoading] = useState(false);
    const [workshopLoading, setWorkshopLoading] = useState(false);
    const [searchTerm, setSearchTerm] = useState('');
    const [workshopQuery, setWorkshopQuery] = useState('');
    const [view, setView] = useState('installed');
    const [busyId, setBusyId] = useState(null);
    const [currentPage, setCurrentPage] = useState(1);

    useEffect(() => {
        loadConfigs();
        loadInstalledMods();
    }, []);

    useEffect(() => {
        if (selectedConfig) {
            loadConfigData(selectedConfig);
            localStorage.setItem('lastSelectedConfig', selectedConfig);
        }
    }, [selectedConfig]);

    useEffect(() => {
        setCurrentPage(1);
    }, [searchTerm]);

    useEffect(() => {
        if (view === 'workshop' && workshopResults.length === 0 && !workshopLoading) {
            runWorkshopSearch('');
        }
    }, [view]);

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

    const loadConfigData = async (configName = selectedConfig) => {
        if (!window.electronAPI || !configName) {
            return null;
        }

        try {
            const data = await window.electronAPI.readConfig(configName);
            setConfigData(data);
            return data;
        } catch (error) {
            console.error('Failed to load config data:', error);
            toast.error('Failed to load configuration data.');
            return null;
        }
    };

    const loadInstalledMods = async () => {
        if (!window.electronAPI) {
            return [];
        }

        setInstalledLoading(true);
        try {
            const list = await window.electronAPI.getMods();
            setInstalledMods(list);
            return list;
        } catch (error) {
            console.error('Failed to load installed mods:', error);
            toast.error('Failed to load installed workshop items.');
            return [];
        } finally {
            setInstalledLoading(false);
        }
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
            console.error('Failed to search Steam Workshop:', error);
            toast.error('Failed to browse Steam Workshop.');
        } finally {
            setWorkshopLoading(false);
        }
    };

    const reloadEverything = async () => {
        await Promise.all([
            loadConfigs(),
            loadInstalledMods(),
            loadConfigData(selectedConfig),
            view === 'workshop' ? runWorkshopSearch(workshopQuery) : Promise.resolve()
        ]);
    };

    const enabledWorkshopIds = useMemo(() => {
        const workshopItems = configData?.config?.WorkshopItems || '';
        return new Set(
            workshopItems
                .split(';')
                .map((id) => id.trim())
                .filter(Boolean)
        );
    }, [configData]);

    const isModEnabled = (workshopId) => enabledWorkshopIds.has(workshopId);

    const filteredInstalledMods = useMemo(() => (
        installedMods.filter((mod) =>
            mod.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
            mod.workshopId.includes(searchTerm)
        )
    ), [installedMods, searchTerm]);

    const totalPages = Math.ceil(filteredInstalledMods.length / ITEMS_PER_PAGE);
    const startIndex = (currentPage - 1) * ITEMS_PER_PAGE;
    const currentInstalledMods = filteredInstalledMods.slice(startIndex, startIndex + ITEMS_PER_PAGE);

    const toggleInstalledMod = async (mod) => {
        if (!window.electronAPI || !selectedConfig) {
            return;
        }

        const modIds = mod.mods.map((entry) => entry.id).filter(Boolean);
        if (modIds.length === 0) {
            toast.error(`"${mod.title}" has no detected mod IDs.`);
            return;
        }

        setBusyId(mod.workshopId);
        try {
            if (isModEnabled(mod.workshopId)) {
                const result = await window.electronAPI.removeMod(selectedConfig, mod.workshopId, modIds);
                if (!result.success) {
                    throw new Error(result.error || 'Unknown remove error');
                }
                toast.success(`Removed mod: ${mod.title}`);
            } else {
                const result = await window.electronAPI.addMod(selectedConfig, mod.workshopId, modIds);
                if (!result.success) {
                    throw new Error(result.error || 'Unknown add error');
                }
                toast.success(`Added mod: ${mod.title}`);
            }

            await loadConfigData(selectedConfig);
        } catch (error) {
            console.error('Failed to toggle mod:', error);
            toast.error(error.message || `Failed to update mod: ${mod.title}`);
        } finally {
            setBusyId(null);
        }
    };

    const handleInstallAndAdd = async (result) => {
        if (!window.electronAPI || !selectedConfig) {
            return;
        }

        setBusyId(result.workshopId);
        try {
            if (!result.installed) {
                await window.electronAPI.installMod(result.workshopId);
            }

            const refreshedInstalledMods = await loadInstalledMods();
            const installedMod = refreshedInstalledMods.find((mod) => mod.workshopId === result.workshopId);
            if (!installedMod || installedMod.mods.length === 0) {
                throw new Error('Workshop item downloaded, but no usable mod.info entries were detected.');
            }

            if (!isModEnabled(result.workshopId)) {
                const addResult = await window.electronAPI.addMod(
                    selectedConfig,
                    installedMod.workshopId,
                    installedMod.mods.map((entry) => entry.id).filter(Boolean)
                );

                if (!addResult.success) {
                    throw new Error(addResult.error || 'Failed to add workshop item to the configuration.');
                }
            }

            toast.success(`${result.title} is ready in ${selectedConfig}.`);
            await Promise.all([
                loadConfigData(selectedConfig),
                runWorkshopSearch(workshopQuery)
            ]);
        } catch (error) {
            console.error('Failed to install/add workshop item:', error);
            toast.error(error.message || `Failed to install ${result.title}`);
        } finally {
            setBusyId(null);
        }
    };

    return (
        <div className="space-y-6 h-full flex flex-col w-full">
            <div className="flex flex-col gap-4 shrink-0 lg:flex-row lg:items-center lg:justify-between">
                <div>
                    <h2 className="text-2xl font-bold text-text tracking-tight">Mods Manager</h2>
                    <p className="text-sm text-text-muted">
                        Browse local workshop content or search Steam Workshop for <span className="text-primary font-medium">{selectedConfig}</span>
                    </p>
                </div>

                <div className="flex flex-wrap items-center gap-3">
                    <div className="relative">
                        <select
                            value={selectedConfig}
                            onChange={(e) => setSelectedConfig(e.target.value)}
                            className="bg-surface border border-border text-text pl-4 pr-10 py-2 rounded-md outline-none focus:ring-1 focus:ring-primary appearance-none min-w-[200px]"
                        >
                            {configs.map((configName) => <option key={configName} value={configName}>{configName}</option>)}
                            <option value="servertest">servertest (Default)</option>
                        </select>
                        <Server className="absolute right-3 top-1/2 -translate-y-1/2 text-text-muted pointer-events-none" size={14} />
                    </div>

                    <button
                        onClick={reloadEverything}
                        className="p-2 bg-surface hover:bg-surface-hover border border-border text-text-muted hover:text-text rounded-md transition-all"
                        title="Reload Mods and Config"
                    >
                        <RefreshCw size={20} className={(installedLoading || workshopLoading) ? 'animate-spin' : ''} />
                    </button>
                </div>
            </div>

            <div className="flex gap-2 shrink-0">
                <button onClick={() => setView('installed')} className={tabClassName(view === 'installed')}>
                    Installed Mods
                </button>
                <button onClick={() => setView('workshop')} className={tabClassName(view === 'workshop')}>
                    Workshop Browser
                </button>
            </div>

            {view === 'installed' ? (
                <>
                    <div className="relative shrink-0">
                        <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-text-muted" size={18} />
                        <input
                            type="text"
                            placeholder="Search installed mods..."
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            className="w-full bg-surface border border-border text-text pl-12 pr-4 py-3 rounded-lg outline-none focus:ring-1 focus:ring-primary shadow-sm transition-all"
                        />
                    </div>

                    <div className="flex-1 overflow-y-auto pr-2 custom-scrollbar flex flex-col">
                        {installedLoading ? (
                            <div className="flex flex-col items-center justify-center h-64 text-text-muted gap-3">
                                <RefreshCw size={32} className="animate-spin text-primary" />
                                <span className="font-medium animate-pulse">Scanning workshop directory...</span>
                            </div>
                        ) : (
                            <>
                                <motion.div
                                    initial={{ opacity: 0 }}
                                    animate={{ opacity: 1 }}
                                    className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4 pb-6 flex-1 content-start"
                                >
                                    <AnimatePresence mode="popLayout">
                                        {currentInstalledMods.map((mod) => {
                                            const enabled = isModEnabled(mod.workshopId);
                                            return (
                                                <motion.div
                                                    layout
                                                    key={mod.workshopId}
                                                    className={clsx(
                                                        'group relative bg-surface border rounded-lg overflow-hidden shadow-sm h-fit',
                                                        enabled ? 'border-primary ring-1 ring-primary' : 'border-border hover:border-primary/50'
                                                    )}
                                                >
                                                    <div className="aspect-video bg-black/20 relative overflow-hidden border-b border-border">
                                                        {mod.preview ? (
                                                            <img
                                                                src={mod.preview?.startsWith('http') ? mod.preview : `media://${mod.preview}`}
                                                                alt={mod.title}
                                                                className={clsx(
                                                                    'w-full h-full object-cover transition-all duration-500',
                                                                    enabled ? 'grayscale-0' : 'grayscale contrast-125 group-hover:grayscale-0'
                                                                )}
                                                            />
                                                        ) : (
                                                            <div className="w-full h-full flex items-center justify-center text-text-muted">
                                                                <Box size={32} className="opacity-20" />
                                                            </div>
                                                        )}
                                                    </div>

                                                    <div className="p-3 space-y-3">
                                                        <div className="flex items-start justify-between gap-3">
                                                            <h3 className="font-semibold text-text leading-tight text-sm line-clamp-2" title={mod.title}>
                                                                {mod.title}
                                                            </h3>
                                                            {enabled && (
                                                                <span className="bg-primary text-white text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wide flex items-center gap-1">
                                                                    <Check size={10} strokeWidth={3} />
                                                                    Active
                                                                </span>
                                                            )}
                                                        </div>

                                                        <div className="flex items-center justify-between text-xs text-text-muted">
                                                            <span className="bg-background px-1.5 py-0.5 rounded border border-border font-mono text-[10px]">ID: {mod.workshopId}</span>
                                                            <a
                                                                href={`https://steamcommunity.com/sharedfiles/filedetails/?id=${mod.workshopId}`}
                                                                target="_blank"
                                                                rel="noopener noreferrer"
                                                                className="hover:text-text transition-colors p-1 hover:bg-surface-hover rounded"
                                                                title="View on Steam Workshop"
                                                            >
                                                                <ExternalLink size={12} />
                                                            </a>
                                                        </div>

                                                        <div className="text-[10px] text-text-muted/70 truncate pt-2 border-t border-border/50">
                                                            {mod.mods.length} sub-mod{mod.mods.length !== 1 ? 's' : ''}
                                                        </div>

                                                        <button
                                                            onClick={() => toggleInstalledMod(mod)}
                                                            disabled={busyId === mod.workshopId}
                                                            className={clsx(
                                                                'w-full flex items-center justify-center gap-2 px-3 py-2 rounded-md text-sm font-medium transition-colors disabled:opacity-50',
                                                                enabled
                                                                    ? 'bg-error/10 hover:bg-error/20 border border-error/20 text-error'
                                                                    : 'bg-primary/10 hover:bg-primary/20 border border-primary/20 text-primary'
                                                            )}
                                                        >
                                                            {busyId === mod.workshopId ? <RefreshCw size={14} className="animate-spin" /> : enabled ? <Check size={14} /> : <Plus size={14} />}
                                                            <span>{enabled ? 'Remove from Config' : 'Add to Config'}</span>
                                                        </button>
                                                    </div>
                                                </motion.div>
                                            );
                                        })}
                                    </AnimatePresence>

                                    {filteredInstalledMods.length === 0 && (
                                        <div className="col-span-full text-center py-12 text-text-muted">
                                            <Box size={48} className="mx-auto mb-4 opacity-20" />
                                            <p>No installed mods found matching "{searchTerm}"</p>
                                        </div>
                                    )}
                                </motion.div>

                                {filteredInstalledMods.length > ITEMS_PER_PAGE && (
                                    <div className="flex items-center justify-center gap-4 py-4 border-t border-border mt-auto shrink-0">
                                        <button
                                            onClick={() => setCurrentPage((page) => Math.max(1, page - 1))}
                                            disabled={currentPage === 1}
                                            className="p-2 rounded-md border border-border bg-surface hover:bg-surface-hover disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
                                        >
                                            <ChevronLeft size={16} />
                                        </button>
                                        <span className="text-sm text-text-muted">
                                            Page <span className="text-text font-medium">{currentPage}</span> of <span className="text-text font-medium">{totalPages}</span>
                                        </span>
                                        <button
                                            onClick={() => setCurrentPage((page) => Math.min(totalPages, page + 1))}
                                            disabled={currentPage === totalPages}
                                            className="p-2 rounded-md border border-border bg-surface hover:bg-surface-hover disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
                                        >
                                            <ChevronRight size={16} />
                                        </button>
                                    </div>
                                )}
                            </>
                        )}
                    </div>
                </>
            ) : (
                <div className="flex-1 min-h-0 flex flex-col gap-4">
                    <form
                        onSubmit={(e) => {
                            e.preventDefault();
                            runWorkshopSearch(workshopQuery);
                        }}
                        className="flex gap-3 shrink-0"
                    >
                        <div className="relative flex-1">
                            <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-text-muted" size={18} />
                            <input
                                type="text"
                                placeholder="Search Steam Workshop or leave empty for trending..."
                                value={workshopQuery}
                                onChange={(e) => setWorkshopQuery(e.target.value)}
                                className="w-full bg-surface border border-border text-text pl-12 pr-4 py-3 rounded-lg outline-none focus:ring-1 focus:ring-primary shadow-sm transition-all"
                            />
                        </div>
                        <button
                            type="submit"
                            disabled={workshopLoading}
                            className="px-4 py-3 bg-primary text-white rounded-lg hover:bg-primary-hover transition-colors disabled:opacity-50"
                        >
                            {workshopLoading ? 'Searching...' : 'Search'}
                        </button>
                    </form>

                    <div className="flex-1 overflow-y-auto pr-2 custom-scrollbar">
                        {workshopLoading ? (
                            <div className="flex flex-col items-center justify-center h-64 text-text-muted gap-3">
                                <RefreshCw size={32} className="animate-spin text-primary" />
                                <span className="font-medium animate-pulse">Loading Steam Workshop results...</span>
                            </div>
                        ) : workshopResults.length === 0 ? (
                            <div className="text-center py-12 text-text-muted bg-surface border border-dashed border-border rounded-lg">
                                <Box size={48} className="mx-auto mb-4 opacity-20" />
                                <p>No workshop results found.</p>
                            </div>
                        ) : (
                            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4 pb-6">
                                {workshopResults.map((result) => {
                                    const enabled = isModEnabled(result.workshopId);
                                    const busy = busyId === result.workshopId;
                                    return (
                                        <div key={result.workshopId} className="bg-surface border border-border rounded-lg overflow-hidden shadow-sm">
                                            <div className="aspect-video bg-black/20 relative overflow-hidden border-b border-border">
                                                {result.preview ? (
                                                    <img src={result.preview} alt={result.title} className="w-full h-full object-cover" />
                                                ) : (
                                                    <div className="w-full h-full flex items-center justify-center text-text-muted">
                                                        <Box size={32} className="opacity-20" />
                                                    </div>
                                                )}
                                            </div>

                                            <div className="p-4 space-y-3">
                                                <div className="flex items-start justify-between gap-3">
                                                    <div>
                                                        <h3 className="font-semibold text-text leading-tight">{result.title}</h3>
                                                        {result.author && (
                                                            <p className="text-xs text-text-muted mt-1">by {result.author}</p>
                                                        )}
                                                    </div>
                                                    {enabled ? (
                                                        <span className="bg-primary text-white text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wide flex items-center gap-1 shrink-0">
                                                            <Check size={10} strokeWidth={3} />
                                                            Active
                                                        </span>
                                                    ) : result.installed ? (
                                                        <span className="bg-success/10 text-success text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wide shrink-0">
                                                            Installed
                                                        </span>
                                                    ) : null}
                                                </div>

                                                <div className="flex items-center justify-between text-xs text-text-muted">
                                                    <span className="bg-background px-1.5 py-0.5 rounded border border-border font-mono text-[10px]">ID: {result.workshopId}</span>
                                                    <a
                                                        href={`https://steamcommunity.com/sharedfiles/filedetails/?id=${result.workshopId}`}
                                                        target="_blank"
                                                        rel="noopener noreferrer"
                                                        className="hover:text-text transition-colors p-1 hover:bg-surface-hover rounded"
                                                        title="View on Steam Workshop"
                                                    >
                                                        <ExternalLink size={12} />
                                                    </a>
                                                </div>

                                                <button
                                                    onClick={() => handleInstallAndAdd(result)}
                                                    disabled={busy || enabled}
                                                    className={clsx(
                                                        'w-full flex items-center justify-center gap-2 px-3 py-2 rounded-md text-sm font-medium transition-colors disabled:opacity-50',
                                                        enabled
                                                            ? 'bg-primary/10 border border-primary/20 text-primary'
                                                            : 'bg-primary text-white hover:bg-primary-hover'
                                                    )}
                                                >
                                                    {busy ? <RefreshCw size={14} className="animate-spin" /> : result.installed ? <Plus size={14} /> : <Download size={14} />}
                                                    <span>
                                                        {enabled
                                                            ? 'Already Added'
                                                            : result.installed
                                                                ? 'Add to Config'
                                                                : 'Install and Add'}
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    );
                                })}
                            </div>
                        )}
                    </div>
                </div>
            )}
        </div>
    );
};

export default Mods;
