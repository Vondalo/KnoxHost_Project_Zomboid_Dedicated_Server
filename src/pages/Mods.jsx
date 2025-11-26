import React, { useState, useEffect } from 'react';
import { Search, RefreshCw, Box, Check, ExternalLink, Filter, ChevronLeft, ChevronRight } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import clsx from 'clsx';

const Mods = () => {
    const [mods, setMods] = useState([]);
    const [loading, setLoading] = useState(false);
    const [searchTerm, setSearchTerm] = useState('');
    const [selectedConfig, setSelectedConfig] = useState(() => localStorage.getItem('lastSelectedConfig') || 'servertest');
    const [configData, setConfigData] = useState(null);

    // Pagination State
    const [currentPage, setCurrentPage] = useState(1);
    const itemsPerPage = 12;

    useEffect(() => {
        loadMods();
    }, []);

    useEffect(() => {
        loadConfigData();
    }, [selectedConfig]);

    // Reset page when search changes
    useEffect(() => {
        setCurrentPage(1);
    }, [searchTerm]);

    const loadMods = async () => {
        if (!window.electronAPI) return;
        setLoading(true);
        try {
            const list = await window.electronAPI.getMods();
            setMods(list);
        } catch (error) {
            console.error("Failed to load mods:", error);
        } finally {
            setLoading(false);
        }
    };

    const loadConfigData = async () => {
        if (!window.electronAPI) return;
        try {
            const data = await window.electronAPI.readConfig(selectedConfig);
            setConfigData(data);
        } catch (error) {
            console.error("Failed to load config data:", error);
        }
    };

    const isModEnabled = (workshopId) => {
        if (!configData?.config?.WorkshopItems) return false;
        return configData.config.WorkshopItems.includes(workshopId);
    };

    const toggleMod = async (mod) => {
        if (!window.electronAPI) return;
        const isEnabled = isModEnabled(mod.workshopId);
        const modIds = mod.mods.map(m => m.id);

        try {
            if (isEnabled) {
                await window.electronAPI.removeMod(selectedConfig, mod.workshopId, modIds);
            } else {
                await window.electronAPI.addMod(selectedConfig, mod.workshopId, modIds);
            }
            await loadConfigData();
        } catch (error) {
            console.error("Failed to toggle mod:", error);
        }
    };

    const filteredMods = mods.filter(mod =>
        mod.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
        mod.workshopId.includes(searchTerm)
    );

    // Pagination Logic
    const totalPages = Math.ceil(filteredMods.length / itemsPerPage);
    const startIndex = (currentPage - 1) * itemsPerPage;
    const currentMods = filteredMods.slice(startIndex, startIndex + itemsPerPage);

    const container = {
        hidden: { opacity: 0 },
        show: {
            opacity: 1,
            transition: {
                staggerChildren: 0.05
            }
        }
    };

    const item = {
        hidden: { opacity: 0, y: 20 },
        show: { opacity: 1, y: 0 }
    };

    return (
        <div className="space-y-6 h-full flex flex-col w-full">
            {/* Header */}
            <div className="flex items-center justify-between shrink-0">
                <div>
                    <h2 className="text-2xl font-bold text-text tracking-tight">Mod Database</h2>
                    <p className="text-sm text-text-muted">Manage workshop content for <span className="text-primary font-medium">{selectedConfig}</span></p>
                </div>
                <button
                    onClick={loadMods}
                    className="p-2 bg-surface hover:bg-surface-hover border border-border text-text-muted hover:text-text rounded-md transition-all"
                    title="Refresh Mods"
                >
                    <RefreshCw size={20} className={loading ? 'animate-spin' : ''} />
                </button>
            </div>

            {/* Search Bar */}
            <div className="relative shrink-0">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-text-muted" size={18} />
                <input
                    type="text"
                    placeholder="Search mod database..."
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    className="w-full bg-surface border border-border text-text pl-12 pr-4 py-3 rounded-lg outline-none focus:ring-1 focus:ring-primary shadow-sm transition-all"
                />
            </div>

            {/* Mod Grid */}
            <div className="flex-1 overflow-y-auto pr-2 custom-scrollbar flex flex-col">
                {loading ? (
                    <div className="flex flex-col items-center justify-center h-64 text-text-muted gap-3">
                        <RefreshCw size={32} className="animate-spin text-primary" />
                        <span className="font-medium animate-pulse">Scanning workshop directory...</span>
                    </div>
                ) : (
                    <>
                        <motion.div
                            variants={container}
                            initial="hidden"
                            animate="show"
                            className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4 pb-6 flex-1 content-start"
                        >
                            <AnimatePresence mode="popLayout">
                                {currentMods.map(mod => {
                                    const enabled = isModEnabled(mod.workshopId);
                                    return (
                                        <motion.div
                                            layout
                                            variants={item}
                                            key={mod.workshopId}
                                            onClick={() => toggleMod(mod)}
                                            whileHover={{ y: -4, transition: { duration: 0.2 } }}
                                            className={clsx(
                                                "group relative bg-surface border rounded-lg cursor-pointer transition-colors duration-200 overflow-hidden shadow-sm hover:shadow-lg h-fit",
                                                enabled ? 'border-primary ring-1 ring-primary' : 'border-border hover:border-primary/50'
                                            )}
                                        >
                                            {/* Status Badge */}
                                            <AnimatePresence>
                                                {enabled && (
                                                    <motion.div
                                                        initial={{ opacity: 0, scale: 0.8 }}
                                                        animate={{ opacity: 1, scale: 1 }}
                                                        exit={{ opacity: 0, scale: 0.8 }}
                                                        className="absolute top-2 right-2 bg-primary text-white text-[10px] font-bold px-2 py-0.5 rounded-full z-10 shadow-sm uppercase tracking-wide flex items-center gap-1"
                                                    >
                                                        <Check size={10} strokeWidth={3} />
                                                        Active
                                                    </motion.div>
                                                )}
                                            </AnimatePresence>

                                            {/* Image */}
                                            <div className="aspect-video bg-black/20 relative overflow-hidden border-b border-border">
                                                {mod.preview ? (
                                                    <img
                                                        src={`file://${mod.preview}`}
                                                        alt={mod.title}
                                                        className={clsx(
                                                            "w-full h-full object-cover transition-all duration-500",
                                                            enabled ? 'grayscale-0' : 'grayscale contrast-125 group-hover:grayscale-0'
                                                        )}
                                                    />
                                                ) : (
                                                    <div className="w-full h-full flex items-center justify-center text-text-muted">
                                                        <Box size={32} className="opacity-20" />
                                                    </div>
                                                )}
                                                {/* Hover Overlay */}
                                                <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
                                            </div>

                                            {/* Content */}
                                            <div className="p-3 space-y-2">
                                                <h3 className="font-semibold text-text truncate leading-tight group-hover:text-primary transition-colors text-sm" title={mod.title}>
                                                    {mod.title}
                                                </h3>

                                                <div className="flex items-center justify-between text-xs text-text-muted">
                                                    <span className="bg-background px-1.5 py-0.5 rounded border border-border font-mono text-[10px]">ID: {mod.workshopId}</span>
                                                    <a
                                                        href={`https://steamcommunity.com/sharedfiles/filedetails/?id=${mod.workshopId}`}
                                                        target="_blank"
                                                        rel="noopener noreferrer"
                                                        onClick={(e) => e.stopPropagation()}
                                                        className="hover:text-text transition-colors p-1 hover:bg-surface-hover rounded"
                                                        title="View on Steam Workshop"
                                                    >
                                                        <ExternalLink size={12} />
                                                    </a>
                                                </div>

                                                {mod.mods && mod.mods.length > 0 && (
                                                    <div className="text-[10px] text-text-muted/70 truncate mt-2 pt-2 border-t border-border/50">
                                                        {mod.mods.length} sub-mod{mod.mods.length !== 1 ? 's' : ''}
                                                    </div>
                                                )}
                                            </div>
                                        </motion.div>
                                    );
                                })}
                            </AnimatePresence>

                            {filteredMods.length === 0 && (
                                <div className="col-span-full text-center py-12 text-text-muted">
                                    <Box size={48} className="mx-auto mb-4 opacity-20" />
                                    <p>No mods found matching "{searchTerm}"</p>
                                </div>
                            )}
                        </motion.div>

                        {/* Pagination Controls */}
                        {filteredMods.length > itemsPerPage && (
                            <div className="flex items-center justify-center gap-4 py-4 border-t border-border mt-auto shrink-0">
                                <button
                                    onClick={() => setCurrentPage(p => Math.max(1, p - 1))}
                                    disabled={currentPage === 1}
                                    className="p-2 rounded-md border border-border bg-surface hover:bg-surface-hover disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
                                >
                                    <ChevronLeft size={16} />
                                </button>
                                <span className="text-sm text-text-muted">
                                    Page <span className="text-text font-medium">{currentPage}</span> of <span className="text-text font-medium">{totalPages}</span>
                                </span>
                                <button
                                    onClick={() => setCurrentPage(p => Math.min(totalPages, p + 1))}
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
        </div>
    );
};

export default Mods;
