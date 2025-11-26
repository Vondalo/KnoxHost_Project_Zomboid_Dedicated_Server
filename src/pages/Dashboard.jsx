import React, { useState, useEffect, useRef } from 'react';
import { Play, Square, Activity, Terminal, Settings, Server, Clock, Users, Save, Trash2, FolderOpen, RefreshCw, Timer, RotateCcw } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import clsx from 'clsx';

const Dashboard = () => {
    const [isRunning, setIsRunning] = useState(false);
    const [logs, setLogs] = useState([]);
    const [configs, setConfigs] = useState([]);
    const [serverName, setServerName] = useState(() => localStorage.getItem('lastSelectedConfig') || 'servertest');
    const [skipModVerification, setSkipModVerification] = useState(false);
    const [backupInterval, setBackupInterval] = useState(0);
    const [restartTime, setRestartTime] = useState('');
    const logsEndRef = useRef(null);

    useEffect(() => {
        loadConfigs();

        if (window.electronAPI) {
            window.electronAPI.getServerStatus().then(status => setIsRunning(status));
            window.electronAPI.getServerLogs().then(history => {
                if (history && history.length > 0) {
                    setLogs(history);
                }
            });

            const cleanupOutput = window.electronAPI.onServerOutput((data) => {
                setLogs((prev) => {
                    const newLogs = [...prev, data];
                    if (newLogs.length > 500) {
                        return newLogs.slice(newLogs.length - 500);
                    }
                    return newLogs;
                });
                if (data.includes('Server started')) setIsRunning(true);
                if (data.includes('Server stopped')) setIsRunning(false);
            });

            const cleanupBackup = window.electronAPI.onBackupComplete((result) => {
                if (result.success) {
                    setLogs(prev => [...prev, `[Auto-Backup] Success: ${result.path.split(/[\\/]/).pop()}`]);
                } else {
                    setLogs(prev => [...prev, `[Auto-Backup] Failed: ${result.error}`]);
                }
            });

            return () => {
                cleanupOutput();
                cleanupBackup();
            };
        } else {
            setLogs(prev => [...prev, 'Electron API not available. Are you running in a browser?']);
        }
    }, []);

    useEffect(() => {
        logsEndRef.current?.scrollIntoView({ behavior: 'smooth' });
    }, [logs]);

    useEffect(() => {
        localStorage.setItem('lastSelectedConfig', serverName);
    }, [serverName]);

    const loadConfigs = async () => {
        if (!window.electronAPI) return;
        const list = await window.electronAPI.getConfigs();
        setConfigs(list);
        if (list.length > 0 && !list.includes(serverName)) {
            setServerName(list[0]);
        }
    };

    const handleStart = async () => {
        if (!window.electronAPI) return;
        setLogs((prev) => [...prev, `Starting server '${serverName}'...`]);
        await window.electronAPI.startServer(serverName, skipModVerification);
        setIsRunning(true);
    };

    const handleStop = async () => {
        if (!window.electronAPI) return;
        setLogs((prev) => [...prev, 'Stopping server...']);
        await window.electronAPI.stopServer();
        setIsRunning(false);
    };

    const handleBackupSchedule = async (e) => {
        const minutes = parseInt(e.target.value);
        setBackupInterval(minutes);
        if (window.electronAPI) {
            if (minutes > 0) {
                await window.electronAPI.startBackupSchedule(minutes);
                setLogs(prev => [...prev, `Backup schedule started: Every ${minutes} minutes.`]);
            } else {
                await window.electronAPI.stopBackupSchedule();
                setLogs(prev => [...prev, 'Backup schedule stopped.']);
            }
        }
    };

    const handleRestartSchedule = async (e) => {
        const time = e.target.value;
        setRestartTime(time);
        if (window.electronAPI) {
            if (time) {
                await window.electronAPI.startRestartSchedule(time);
                setLogs(prev => [...prev, `Restart schedule set for ${time} daily.`]);
            } else {
                await window.electronAPI.stopRestartSchedule();
                setLogs(prev => [...prev, 'Restart schedule stopped.']);
            }
        }
    };

    return (
        <div className="space-y-6 h-full flex flex-col w-full">
            {/* Top Stats Row */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6 shrink-0">
                {/* Status Card */}
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: 0.1 }}
                    className="bg-surface border border-border rounded-lg p-6 shadow-sm relative overflow-hidden group"
                >
                    <div className="absolute inset-0 bg-gradient-to-br from-primary/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500" />

                    <div className="flex items-center justify-between mb-4 relative z-10">
                        <h3 className="text-text-muted text-sm font-medium uppercase tracking-wider">Server Status</h3>
                        <Activity size={18} className={isRunning ? "text-success animate-pulse" : "text-text-dim"} />
                    </div>
                    <div className="flex items-baseline gap-2 relative z-10">
                        <motion.span
                            key={isRunning ? 'online' : 'offline'}
                            initial={{ opacity: 0, scale: 0.9 }}
                            animate={{ opacity: 1, scale: 1 }}
                            className={clsx("text-3xl font-bold tracking-tight", isRunning ? "text-success" : "text-text-dim")}
                        >
                            {isRunning ? 'ONLINE' : 'OFFLINE'}
                        </motion.span>
                    </div>
                    <div className="mt-4 flex items-center gap-2 text-xs text-text-muted font-mono relative z-10">
                        <Server size={12} />
                        <span>{serverName}</span>
                    </div>

                    {isRunning && (
                        <motion.div
                            className="absolute -right-4 -bottom-4 w-24 h-24 bg-success/10 rounded-full blur-2xl"
                            animate={{ scale: [1, 1.2, 1], opacity: [0.3, 0.6, 0.3] }}
                            transition={{ duration: 4, repeat: Infinity }}
                        />
                    )}
                </motion.div>

                {/* Controls Card */}
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: 0.2 }}
                    className="bg-surface border border-border rounded-lg p-6 shadow-sm md:col-span-2 flex flex-col justify-between relative overflow-hidden"
                >
                    <div className="flex items-center justify-between mb-4 relative z-10">
                        <h3 className="text-text-muted text-sm font-medium uppercase tracking-wider">Server Controls</h3>
                        <div className="flex items-center gap-2">
                            <motion.span
                                animate={{ scale: [1, 1.2, 1] }}
                                transition={{ duration: 2, repeat: Infinity }}
                                className="w-2 h-2 rounded-full bg-primary"
                            />
                            <span className="text-xs text-text-muted font-mono">READY</span>
                        </div>
                    </div>

                    <div className="flex flex-col md:flex-row gap-4 items-end relative z-10">
                        <div className="flex-1 w-full space-y-2">
                            <label className="text-xs text-text-muted font-medium">Configuration</label>
                            <div className="relative group">
                                <select
                                    value={serverName}
                                    onChange={(e) => setServerName(e.target.value)}
                                    disabled={isRunning}
                                    className="w-full bg-background border border-border rounded-md px-3 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary disabled:opacity-50 appearance-none transition-shadow group-hover:border-primary/50"
                                >
                                    {configs.map(c => <option key={c} value={c}>{c}</option>)}
                                    <option value="servertest">servertest (Default)</option>
                                </select>
                                <Settings className="absolute right-3 top-1/2 -translate-y-1/2 text-text-muted pointer-events-none group-hover:text-primary transition-colors" size={14} />
                            </div>
                        </div>

                        <div className="flex items-center gap-2 pb-2">
                            <label className="flex items-center gap-2 cursor-pointer select-none group">
                                <input
                                    type="checkbox"
                                    checked={skipModVerification}
                                    onChange={(e) => setSkipModVerification(e.target.checked)}
                                    className="w-4 h-4 rounded border-border bg-background text-primary focus:ring-primary focus:ring-offset-background transition-all"
                                />
                                <span className="text-xs text-text-muted group-hover:text-text transition-colors">Skip Mod Verify</span>
                            </label>
                        </div>

                        <div className="flex gap-3 w-full md:w-auto">
                            <motion.button
                                whileHover={{ scale: 1.02 }}
                                whileTap={{ scale: 0.98 }}
                                onClick={handleStart}
                                disabled={isRunning || !window.electronAPI}
                                className="flex-1 md:flex-none flex items-center justify-center gap-2 px-6 py-2 bg-success/10 hover:bg-success/20 border border-success/20 hover:border-success text-success rounded-md transition-all disabled:opacity-50 disabled:cursor-not-allowed shadow-sm hover:shadow-success/20"
                            >
                                <Play size={16} fill="currentColor" />
                                <span className="font-medium">Start</span>
                            </motion.button>
                            <motion.button
                                whileHover={{ scale: 1.02 }}
                                whileTap={{ scale: 0.98 }}
                                onClick={handleStop}
                                disabled={!isRunning || !window.electronAPI}
                                className="flex-1 md:flex-none flex items-center justify-center gap-2 px-6 py-2 bg-error/10 hover:bg-error/20 border border-error/20 hover:border-error text-error rounded-md transition-all disabled:opacity-50 disabled:cursor-not-allowed shadow-sm hover:shadow-error/20"
                            >
                                <Square size={16} fill="currentColor" />
                                <span className="font-medium">Stop</span>
                            </motion.button>
                        </div>
                    </div>
                </motion.div>
            </div>

            {/* Console Output */}
            <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.3 }}
                className="flex-1 flex flex-col min-h-[300px] bg-surface border border-border rounded-lg overflow-hidden shadow-sm"
            >
                <div className="bg-surface-hover px-4 py-2 border-b border-border flex items-center justify-between">
                    <div className="flex items-center gap-2">
                        <Terminal size={14} className="text-text-muted" />
                        <span className="text-xs font-mono text-text-muted">server_console.log</span>
                    </div>
                    <div className="flex gap-1.5">
                        <div className="w-2.5 h-2.5 rounded-full bg-border"></div>
                        <div className="w-2.5 h-2.5 rounded-full bg-border"></div>
                    </div>
                </div>
                <div className="flex-1 p-4 overflow-y-auto font-mono text-xs text-text-dim space-y-0.5 bg-black/50">
                    {logs.map((log, i) => (
                        <motion.div
                            initial={{ opacity: 0, x: -10 }}
                            animate={{ opacity: 1, x: 0 }}
                            transition={{ duration: 0.2 }}
                            key={i}
                            className="break-all hover:bg-white/5 px-1 rounded-sm transition-colors"
                        >
                            <span className="text-text-muted opacity-40 mr-2">[{new Date().toLocaleTimeString()}]</span>
                            <span className="text-text-muted">{log}</span>
                        </motion.div>
                    ))}
                    <div ref={logsEndRef} />
                </div>

                {/* RCON Input */}
                <div className="bg-surface border-t border-border p-2 flex gap-2 focus-within:bg-surface-hover transition-colors">
                    <span className="text-text-muted font-mono pl-2 self-center">{'>'}</span>
                    <input
                        type="text"
                        placeholder="Enter command..."
                        className="flex-1 bg-transparent border-none outline-none text-text font-mono text-sm placeholder:text-text-muted/50"
                        onKeyDown={(e) => {
                            if (e.key === 'Enter' && e.target.value) {
                                if (window.electronAPI) {
                                    window.electronAPI.sendCommand(e.target.value);
                                    e.target.value = '';
                                }
                            }
                        }}
                    />
                </div>
            </motion.div>

            {/* Save Management */}
            <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.4 }}
                className="bg-surface border border-border rounded-lg p-6 shadow-sm"
            >
                <div className="flex items-center justify-between mb-4">
                    <h3 className="text-text-muted text-sm font-medium uppercase tracking-wider">Save Management</h3>
                    <div className="flex gap-2 items-center">
                        {/* Auto Restart Selector */}
                        <div className="flex items-center gap-2 mr-4 border-r border-border pr-4">
                            <RotateCcw size={14} className="text-text-muted" />
                            <input
                                type="time"
                                value={restartTime}
                                onChange={handleRestartSchedule}
                                className="bg-background border border-border rounded-md px-2 py-1 text-xs text-text focus:outline-none focus:ring-1 focus:ring-primary"
                                title="Daily Restart Time"
                            />
                        </div>

                        {/* Auto Backup Selector */}
                        <div className="flex items-center gap-2 mr-4 border-r border-border pr-4">
                            <Timer size={14} className="text-text-muted" />
                            <select
                                value={backupInterval}
                                onChange={handleBackupSchedule}
                                className="bg-background border border-border rounded-md px-2 py-1 text-xs text-text focus:outline-none focus:ring-1 focus:ring-primary"
                            >
                                <option value="0">Auto-Backup: Off</option>
                                <option value="30">Every 30m</option>
                                <option value="60">Every 1h</option>
                                <option value="120">Every 2h</option>
                                <option value="360">Every 6h</option>
                            </select>
                        </div>

                        <motion.button
                            whileHover={{ scale: 1.05 }}
                            whileTap={{ scale: 0.95 }}
                            onClick={async () => {
                                if (window.electronAPI) await window.electronAPI.openSavesFolder();
                            }}
                            className="flex items-center gap-2 px-3 py-1.5 text-xs font-medium text-text-muted hover:text-text bg-surface-hover hover:bg-border rounded-md transition-colors"
                        >
                            <FolderOpen size={14} />
                            Open Folder
                        </motion.button>
                        <motion.button
                            whileHover={{ scale: 1.05 }}
                            whileTap={{ scale: 0.95 }}
                            onClick={async () => {
                                if (!window.electronAPI) return;
                                if (!confirm("Backup all saves?")) return;
                                const result = await window.electronAPI.backupSaves();
                                if (result.success) alert(`Backup created at: ${result.path}`);
                                else alert(`Backup failed: ${result.error}`);
                            }}
                            className="flex items-center gap-2 px-3 py-1.5 text-xs font-medium text-success bg-success/10 hover:bg-success/20 rounded-md transition-colors"
                        >
                            <Save size={14} />
                            Backup All
                        </motion.button>
                    </div>
                </div>
                <SaveList />
            </motion.div>
        </div>
    );
};

const SaveList = () => {
    const [saves, setSaves] = useState([]);
    const [loading, setLoading] = useState(false);

    const loadSaves = async () => {
        if (!window.electronAPI) return;
        setLoading(true);
        const list = await window.electronAPI.getSaves();
        setSaves(list);
        setLoading(false);
    };

    useEffect(() => {
        loadSaves();
    }, []);

    const handleDelete = async (saveName) => {
        if (!confirm(`Are you sure you want to delete save "${saveName}"? This is irreversible.`)) return;
        if (window.electronAPI) {
            const success = await window.electronAPI.deleteSave(saveName);
            if (success) loadSaves();
            else alert("Failed to delete save.");
        }
    };

    return (
        <div className="bg-background border border-border rounded-md overflow-hidden">
            <div className="bg-surface-hover px-4 py-2 border-b border-border flex justify-between items-center">
                <span className="text-xs font-medium text-text-muted">DETECTED SAVES</span>
                <button onClick={loadSaves} className="text-text-muted hover:text-text transition-colors">
                    <RefreshCw size={12} />
                </button>
            </div>

            <div className="max-h-48 overflow-y-auto p-2 space-y-1">
                {loading ? (
                    <div className="text-center py-4 text-xs text-text-muted animate-pulse">Loading saves...</div>
                ) : saves.length === 0 ? (
                    <div className="text-center py-4 text-xs text-text-muted">No saves found.</div>
                ) : (
                    <AnimatePresence>
                        {saves.map(save => (
                            <motion.div
                                key={save}
                                initial={{ opacity: 0, height: 0 }}
                                animate={{ opacity: 1, height: 'auto' }}
                                exit={{ opacity: 0, height: 0 }}
                                className="flex items-center justify-between px-3 py-2 rounded-md hover:bg-surface-hover group transition-colors"
                            >
                                <div className="flex items-center gap-3">
                                    <FolderOpen size={14} className="text-text-muted group-hover:text-primary transition-colors" />
                                    <span className="text-sm text-text font-medium">{save}</span>
                                </div>
                                <button
                                    onClick={() => handleDelete(save)}
                                    className="text-text-muted hover:text-error opacity-0 group-hover:opacity-100 transition-all"
                                    title="Delete Save"
                                >
                                    <Trash2 size={14} />
                                </button>
                            </motion.div>
                        ))}
                    </AnimatePresence>
                )}
            </div>
        </div>
    );
};

export default Dashboard;
