import React, { useEffect, useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Play, Square, Activity, Terminal, Settings, Server, Save, Trash2, FolderOpen, RefreshCw, Timer, RotateCcw, Download, Shield, ArrowDown } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import clsx from 'clsx';
import { useToast } from '../context/ToastContext';
import ConfirmationModal from '../components/ConfirmationModal';
import SophieWizard from '../components/SophieWizard';
import { subscribeToSettingsChanged } from '../lib/appSettings';

const MAX_LOG_ENTRIES = 500;
const SERVER_SESSION_STATUSES = {
    STOPPED: 'stopped',
    STARTING: 'starting',
    RUNNING: 'running',
    STOPPING: 'stopping'
};
const EMPTY_SERVER_SESSION = {
    status: SERVER_SESSION_STATUSES.STOPPED,
    serverName: null,
    logs: [],
    passwordNeeded: false
};
const SERVER_STATUS_LABELS = {
    [SERVER_SESSION_STATUSES.STOPPED]: 'OFFLINE',
    [SERVER_SESSION_STATUSES.STARTING]: 'STARTING',
    [SERVER_SESSION_STATUSES.RUNNING]: 'ONLINE',
    [SERVER_SESSION_STATUSES.STOPPING]: 'STOPPING'
};
void motion;

function createLogEntry(message, timestamp = Date.now()) {
    return {
        id: `${timestamp}-${Math.random().toString(36).slice(2, 9)}`,
        message,
        timestamp
    };
}

function splitLogChunk(chunk, timestamp = Date.now()) {
    return String(chunk)
        .replace(/\r/g, '')
        .split('\n')
        .map((line) => line.trimEnd())
        .filter((line) => line.length > 0)
        .map((line) => createLogEntry(line, timestamp));
}

function appendLogEntries(existingEntries, nextEntries) {
    const merged = [...existingEntries, ...nextEntries];
    return merged.length > MAX_LOG_ENTRIES ? merged.slice(-MAX_LOG_ENTRIES) : merged;
}

function normalizeHistory(history) {
    if (!Array.isArray(history)) {
        return [];
    }

    return history.flatMap((entry, index) => splitLogChunk(entry, Date.now() + index));
}

function formatLogTime(timestamp) {
    return new Date(timestamp).toLocaleTimeString();
}

const Dashboard = () => {
    const navigate = useNavigate();
    const toast = useToast();
    const consoleRef = useRef(null);
    const [serverSession, setServerSession] = useState(EMPTY_SERVER_SESSION);
    const [logs, setLogs] = useState([]);
    const [configs, setConfigs] = useState([]);
    const [serverName, setServerName] = useState(() => localStorage.getItem('lastSelectedConfig') || 'servertest');
    const [skipModVerification, setSkipModVerification] = useState(false);
    const [backupInterval, setBackupInterval] = useState(0);
    const [restartTime, setRestartTime] = useState('');
    const [isInstalled, setIsInstalled] = useState(true);
    const [installing, setInstalling] = useState(false);
    const [isDedicatedMode, setIsDedicatedMode] = useState(false);
    const [isWizardOpen, setIsWizardOpen] = useState(false);
    const [isFollowingConsole, setIsFollowingConsole] = useState(true);
    const [confirmation, setConfirmation] = useState({ isOpen: false, title: '', message: '', onConfirm: () => { }, confirmText: 'Confirm', confirmColor: 'bg-primary' });
    const isServerActive = serverSession.status !== SERVER_SESSION_STATUSES.STOPPED;
    const canStartServer = serverSession.status === SERVER_SESSION_STATUSES.STOPPED;
    const canStopServer = serverSession.status === SERVER_SESSION_STATUSES.RUNNING;
    const statusLabel = SERVER_STATUS_LABELS[serverSession.status] || SERVER_STATUS_LABELS[SERVER_SESSION_STATUSES.STOPPED];
    const statusToneClass = serverSession.status === SERVER_SESSION_STATUSES.RUNNING
        ? 'text-success'
        : serverSession.status === SERVER_SESSION_STATUSES.STOPPED
            ? 'text-text-dim'
            : 'text-primary';
    const activeServerName = serverSession.serverName || serverName;
    const controlsStatusLabel = serverSession.status === SERVER_SESSION_STATUSES.STARTING
        ? 'BOOTING'
        : serverSession.status === SERVER_SESSION_STATUSES.STOPPING
            ? 'SHUTDOWN'
            : serverSession.status === SERVER_SESSION_STATUSES.RUNNING
                ? 'LIVE'
                : 'READY';

    const appendConsoleMessage = (message) => {
        const entries = splitLogChunk(message);
        if (entries.length === 0) {
            return;
        }

        setLogs((prev) => appendLogEntries(prev, entries));
    };

    const scrollConsoleToBottom = (behavior = 'auto') => {
        if (!consoleRef.current) {
            return;
        }

        consoleRef.current.scrollTo({
            top: consoleRef.current.scrollHeight,
            behavior
        });
    };

    const handleConsoleScroll = () => {
        if (!consoleRef.current) {
            return;
        }

        const { scrollTop, clientHeight, scrollHeight } = consoleRef.current;
        const nearBottom = scrollHeight - (scrollTop + clientHeight) < 32;
        setIsFollowingConsole(nearBottom);
    };

    const applyServerSession = (session) => {
        const nextSession = {
            status: session?.status || SERVER_SESSION_STATUSES.STOPPED,
            serverName: session?.serverName || null,
            logs: Array.isArray(session?.logs) ? session.logs : [],
            passwordNeeded: session?.passwordNeeded === true
        };

        setServerSession(nextSession);
        setLogs(normalizeHistory(nextSession.logs));

        if (nextSession.serverName) {
            setServerName(nextSession.serverName);
        }
    };

    // This effect intentionally hydrates and subscribes once for the dashboard lifecycle.
    /* eslint-disable react-hooks/exhaustive-deps */
    useEffect(() => {
        loadConfigs();
        checkInstallation();
        const interval = setInterval(checkInstallation, 5000);

        if (!window.electronAPI) {
            appendConsoleMessage('Electron API not available. Are you running in a browser?');
            return () => clearInterval(interval);
        }

        let isMounted = true;
        window.electronAPI.getSettings().then((settings) => {
            if (isMounted) {
                setIsDedicatedMode(settings.enableDedicatedServer || false);
            }
        });

        const unsubscribeSettings = subscribeToSettingsChanged((settings) => {
            setIsDedicatedMode(settings.enableDedicatedServer || false);
        });

        window.electronAPI.getServerSession().then((session) => {
            if (isMounted) {
                applyServerSession(session);
            }
        });

        const cleanupSession = window.electronAPI.onServerSessionChanged((session) => {
            if (isMounted) {
                applyServerSession(session);
            }
        });

        const cleanupOutput = window.electronAPI.onServerOutput((data) => {
            if (typeof data === 'string') {
                const nextEntries = splitLogChunk(data);
                if (nextEntries.length > 0) {
                    setLogs((prev) => appendLogEntries(prev, nextEntries));
                }
            }
        });

        const cleanupBackup = window.electronAPI.onBackupComplete((result) => {
            if (result.success) {
                appendConsoleMessage(`[Auto-Backup] Success: ${result.path.split(/[\\/]/).pop()}`);
            } else {
                appendConsoleMessage(`[Auto-Backup] Failed: ${result.error}`);
            }
        });

        return () => {
            isMounted = false;
            clearInterval(interval);
            unsubscribeSettings();
            cleanupSession();
            cleanupOutput();
            cleanupBackup();
        };
    }, []);
    /* eslint-enable react-hooks/exhaustive-deps */

    useEffect(() => {
        if (isFollowingConsole) {
            scrollConsoleToBottom();
        }
    }, [logs, isFollowingConsole]);

    useEffect(() => {
        localStorage.setItem('lastSelectedConfig', serverName);
    }, [serverName]);

    const checkInstallation = async () => {
        if (window.electronAPI) {
            const installed = await window.electronAPI.isServerInstalled();
            setIsInstalled(installed);
        }
    };

    const loadConfigs = async () => {
        if (!window.electronAPI) {
            return;
        }

        const list = await window.electronAPI.getConfigs();
        setConfigs(list);
        if (list.length > 0 && !list.includes(serverName)) {
            setServerName(list[0]);
        }
    };

    const handleInstallServer = async () => {
        setInstalling(true);
        try {
            await window.electronAPI.installServer();
            toast.success('Server installed successfully!');
            setIsInstalled(true);
        } catch (err) {
            console.error(err);
            toast.error('Failed to install server.');
        } finally {
            setInstalling(false);
        }
    };

    const handleStart = async () => {
        if (!window.electronAPI) {
            return;
        }

        setIsFollowingConsole(true);
        await window.electronAPI.startServer(serverName, skipModVerification);
    };

    const handleStop = async () => {
        if (!window.electronAPI) {
            return;
        }

        await window.electronAPI.stopServer();
    };

    const handleBackupSchedule = async (e) => {
        const minutes = parseInt(e.target.value, 10);
        setBackupInterval(minutes);
        if (!window.electronAPI) {
            return;
        }

        if (minutes > 0) {
            await window.electronAPI.startBackupSchedule(minutes);
            appendConsoleMessage(`Backup schedule started: Every ${minutes} minutes.`);
        } else {
            await window.electronAPI.stopBackupSchedule();
            appendConsoleMessage('Backup schedule stopped.');
        }
    };

    const handleRestartSchedule = async (e) => {
        const time = e.target.value;
        setRestartTime(time);
        if (!window.electronAPI) {
            return;
        }

        if (time) {
            await window.electronAPI.startRestartSchedule(time);
            appendConsoleMessage(`Restart schedule set for ${time} daily.`);
        } else {
            await window.electronAPI.stopRestartSchedule();
            appendConsoleMessage('Restart schedule stopped.');
        }
    };

    if (!isDedicatedMode) {
        return (
            <div className="p-8 space-y-8 max-w-7xl mx-auto">
                <SophieWizard
                    isOpen={isWizardOpen}
                    onClose={() => setIsWizardOpen(false)}
                    onComplete={() => {
                        loadConfigs();
                    }}
                />

                <div className="flex justify-between items-center">
                    <div>
                        <h1 className="text-4xl font-bold text-text mb-2 tracking-tight">Co-op Server Setup</h1>
                        <p className="text-text-muted text-lg">Easily configure your non-dedicated server settings.</p>
                    </div>
                    <div className="flex gap-3">
                        <button
                            onClick={() => window.electronAPI.openServerFolder()}
                            className="flex items-center gap-2 px-4 py-2 bg-surface border border-border rounded-lg hover:bg-surface-hover transition-colors text-text-muted hover:text-text"
                        >
                            <FolderOpen size={18} />
                            Open Config Folder
                        </button>
                        <button
                            onClick={() => window.electronAPI.openSavesFolder()}
                            className="flex items-center gap-2 px-4 py-2 bg-surface border border-border rounded-lg hover:bg-surface-hover transition-colors text-text-muted hover:text-text"
                        >
                            <Save size={18} />
                            Open Saves Folder
                        </button>
                    </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="bg-surface border border-border rounded-xl p-6 shadow-lg hover:shadow-xl transition-all duration-300 group"
                    >
                        <div className="flex items-start justify-between mb-6">
                            <div className="p-3 bg-primary/10 rounded-lg text-primary group-hover:scale-110 transition-transform duration-300">
                                <Download size={32} />
                            </div>
                            <div className="px-3 py-1 bg-primary/10 text-primary text-xs font-bold rounded-full uppercase tracking-wider">
                                Recommended
                            </div>
                        </div>

                        <h3 className="text-2xl font-bold text-text mb-2">Install Sophie Preset</h3>
                        <p className="text-text-muted mb-6 leading-relaxed">
                            Automatically download and install the curated <b>Sophie Mod Pack</b>.
                            Includes optimized server settings, sandbox variables, and essential mods for the best co-op experience.
                        </p>

                        <button
                            onClick={() => setIsWizardOpen(true)}
                            className="w-full py-3 bg-primary text-white rounded-lg hover:bg-primary-hover transition-colors font-bold flex items-center justify-center gap-2 shadow-lg shadow-primary/20"
                        >
                            <Download size={20} />
                            Open Installer Wizard
                        </button>
                    </motion.div>

                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.1 }}
                        className="bg-surface border border-border rounded-xl p-6 shadow-lg hover:shadow-xl transition-all duration-300 group"
                    >
                        <div className="flex items-start justify-between mb-6">
                            <div className="p-3 bg-blue-500/10 rounded-lg text-blue-500 group-hover:scale-110 transition-transform duration-300">
                                <Settings size={32} />
                            </div>
                        </div>

                        <h3 className="text-2xl font-bold text-text mb-2">Edit Configuration</h3>
                        <p className="text-text-muted mb-6 leading-relaxed">
                            Fine-tune your server settings. Adjust loot rarity, zombie population, day length, and more.
                            Perfect for customizing the Sophie preset after installation.
                        </p>

                        <button
                            onClick={() => navigate('/config')}
                            className="w-full py-3 bg-surface border border-border text-text rounded-lg hover:bg-surface-hover hover:border-primary/50 transition-all font-bold flex items-center justify-center gap-2"
                        >
                            <Settings size={20} />
                            Go to Config Editor
                        </button>
                    </motion.div>
                </div>

                <div>
                    <h3 className="text-lg font-semibold text-text mb-4">Quick Actions</h3>
                    <div className="grid grid-cols-2 gap-4">
                        <button
                            onClick={async () => {
                                if (window.electronAPI) {
                                    await window.electronAPI.openServerFolder();
                                }
                            }}
                            className="flex items-center justify-center gap-2 px-4 py-3 bg-surface hover:bg-surface-hover border border-border rounded-md text-text transition-colors"
                        >
                            <FolderOpen size={18} />
                            <span>Open Config Folder</span>
                        </button>
                        <button
                            onClick={async () => {
                                if (window.electronAPI) {
                                    await window.electronAPI.openSavesFolder();
                                }
                            }}
                            className="flex items-center justify-center gap-2 px-4 py-3 bg-surface hover:bg-surface-hover border border-border rounded-md text-text transition-colors"
                        >
                            <FolderOpen size={18} />
                            <span>Open Saves Folder</span>
                        </button>
                    </div>
                </div>
            </div>
        );
    }

    return (
        <div className="space-y-6 h-full flex flex-col w-full">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6 shrink-0">
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: 0.1 }}
                    className="bg-surface border border-border rounded-lg p-6 shadow-sm relative overflow-hidden group"
                >
                    <div className="absolute inset-0 bg-gradient-to-br from-primary/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500" />

                    <div className="flex items-center justify-between mb-4 relative z-10">
                        <h3 className="text-text-muted text-sm font-medium uppercase tracking-wider">Server Status</h3>
                        <Activity size={18} className={isServerActive ? `${statusToneClass} animate-pulse` : 'text-text-dim'} />
                    </div>
                    <div className="flex items-baseline gap-2 relative z-10">
                        <motion.span
                            key={serverSession.status}
                            initial={{ opacity: 0, scale: 0.9 }}
                            animate={{ opacity: 1, scale: 1 }}
                            className={clsx('text-3xl font-bold tracking-tight', statusToneClass)}
                        >
                            {statusLabel}
                        </motion.span>
                    </div>
                    <div className="mt-4 flex items-center gap-2 text-xs text-text-muted font-mono relative z-10">
                        <Server size={12} />
                        <span>{activeServerName}</span>
                    </div>

                    {isServerActive && (
                        <motion.div
                            className="absolute -right-4 -bottom-4 w-24 h-24 bg-success/10 rounded-full blur-2xl"
                            animate={{ scale: [1, 1.2, 1], opacity: [0.3, 0.6, 0.3] }}
                            transition={{ duration: 4, repeat: Infinity }}
                        />
                    )}
                </motion.div>

                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: 0.15 }}
                    className="bg-surface border border-border rounded-lg p-6 shadow-sm relative overflow-hidden"
                >
                    <div className="flex items-center justify-between mb-4">
                        <h3 className="text-text-muted text-sm font-medium uppercase tracking-wider">Network Info</h3>
                        <div className="flex gap-1">
                            <div className="w-2 h-2 rounded-full bg-success/50" />
                            <div className="w-2 h-2 rounded-full bg-blue-500/50" />
                        </div>
                    </div>
                    <div className="space-y-3">
                        <div className="flex justify-between items-center">
                            <span className="text-xs text-text-muted">UDP Port</span>
                            <span className="text-sm font-mono text-text bg-surface-hover px-2 py-1 rounded">16261</span>
                        </div>
                        <div className="flex justify-between items-center">
                            <span className="text-xs text-text-muted">Direct Connect</span>
                            <span className="text-sm font-mono text-text bg-surface-hover px-2 py-1 rounded">16262</span>
                        </div>
                    </div>
                </motion.div>

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
                                className={clsx(
                                    'w-2 h-2 rounded-full',
                                    serverSession.status === SERVER_SESSION_STATUSES.RUNNING
                                        ? 'bg-success'
                                        : serverSession.status === SERVER_SESSION_STATUSES.STOPPED
                                            ? 'bg-primary'
                                            : 'bg-warning'
                                )}
                            />
                            <span className="text-xs text-text-muted font-mono">{controlsStatusLabel}</span>
                        </div>
                    </div>

                    <div className="flex flex-col md:flex-row gap-4 items-end relative z-10">
                        <div className="flex-1 w-full space-y-2">
                            <label className="text-xs text-text-muted font-medium">Configuration</label>
                            <div className="relative group">
                                <select
                                    value={serverName}
                                    onChange={(e) => setServerName(e.target.value)}
                                    disabled={!canStartServer}
                                    className="w-full bg-background border border-border rounded-md px-3 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary disabled:opacity-50 appearance-none transition-shadow group-hover:border-primary/50"
                                >
                                    {configs.map((configName) => <option key={configName} value={configName}>{configName}</option>)}
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
                                onClick={() => window.location.hash = '#/admin'}
                                className="flex-1 md:flex-none flex items-center justify-center gap-2 px-4 py-2 bg-surface hover:bg-border border border-border text-text rounded-md transition-all shadow-sm"
                                title="Admin Panel"
                            >
                                <Shield size={16} />
                            </motion.button>
                            {!isInstalled ? (
                                <motion.button
                                    whileHover={{ scale: 1.02 }}
                                    whileTap={{ scale: 0.98 }}
                                    onClick={handleInstallServer}
                                    disabled={installing || !window.electronAPI}
                                    className="flex-1 md:flex-none flex items-center justify-center gap-2 px-6 py-2 bg-primary/10 hover:bg-primary/20 border border-primary/20 hover:border-primary text-primary rounded-md transition-all disabled:opacity-50 disabled:cursor-not-allowed shadow-sm hover:shadow-primary/20"
                                >
                                    {installing ? <RefreshCw size={16} className="animate-spin" /> : <Download size={16} />}
                                    <span className="font-medium">{installing ? 'Installing...' : 'Install Server'}</span>
                                </motion.button>
                            ) : (
                                <>
                                    <motion.button
                                        whileHover={{ scale: 1.02 }}
                                        whileTap={{ scale: 0.98 }}
                                        onClick={handleStart}
                                        disabled={!canStartServer || !window.electronAPI}
                                        className="flex-1 md:flex-none flex items-center justify-center gap-2 px-6 py-2 bg-success/10 hover:bg-success/20 border border-success/20 hover:border-success text-success rounded-md transition-all disabled:opacity-50 disabled:cursor-not-allowed shadow-sm hover:shadow-success/20"
                                    >
                                        <Play size={16} fill="currentColor" />
                                        <span className="font-medium">Start</span>
                                    </motion.button>
                                    <motion.button
                                        whileHover={{ scale: 1.02 }}
                                        whileTap={{ scale: 0.98 }}
                                        onClick={handleStop}
                                        disabled={!canStopServer || !window.electronAPI}
                                        className="flex-1 md:flex-none flex items-center justify-center gap-2 px-6 py-2 bg-error/10 hover:bg-error/20 border border-error/20 hover:border-error text-error rounded-md transition-all disabled:opacity-50 disabled:cursor-not-allowed shadow-sm hover:shadow-error/20"
                                    >
                                        <Square size={16} fill="currentColor" />
                                        <span className="font-medium">Stop</span>
                                    </motion.button>
                                </>
                            )}
                        </div>
                    </div>
                </motion.div>
            </div>

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
                    <div className="flex items-center gap-2">
                        <span className="text-[11px] font-mono text-text-muted">
                            {isFollowingConsole ? 'Following output' : 'Scroll locked'}
                        </span>
                        {!isFollowingConsole && (
                            <button
                                onClick={() => {
                                    setIsFollowingConsole(true);
                                    scrollConsoleToBottom('smooth');
                                }}
                                className="flex items-center gap-1 px-2 py-1 text-xs border border-border rounded bg-surface hover:bg-border text-text-muted hover:text-text transition-colors"
                            >
                                <ArrowDown size={12} />
                                Jump to latest
                            </button>
                        )}
                    </div>
                </div>

                <div
                    ref={consoleRef}
                    onScroll={handleConsoleScroll}
                    className="flex-1 p-4 overflow-y-auto font-mono text-xs text-text-dim space-y-0.5 bg-black/50"
                >
                    {logs.map((log) => (
                        <div
                            key={log.id}
                            className="break-all hover:bg-white/5 px-1 rounded-sm transition-colors"
                        >
                            <span className="text-text-muted opacity-40 mr-2">[{formatLogTime(log.timestamp)}]</span>
                            <span className="text-text-muted">{log.message}</span>
                        </div>
                    ))}
                </div>

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

            <AnimatePresence>
                {serverSession.passwordNeeded && (
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        exit={{ opacity: 0, y: 20 }}
                        className="bg-warning/10 border border-warning/50 rounded-lg p-4 flex items-center justify-between shadow-lg animate-pulse"
                    >
                        <div className="flex items-center gap-3">
                            <div className="p-2 bg-warning/20 rounded-full text-warning">
                                <Terminal size={20} />
                            </div>
                            <div>
                                <h4 className="text-warning font-bold">Admin Password Required!</h4>
                                <p className="text-xs text-text-muted">The server is waiting for you to set an admin password. Please type it in the console below and press Enter.</p>
                            </div>
                        </div>
                    </motion.div>
                )}
            </AnimatePresence>

            <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.4 }}
                className="bg-surface border border-border rounded-lg p-6 shadow-sm"
            >
                <div className="flex items-center justify-between mb-4">
                    <h3 className="text-text-muted text-sm font-medium uppercase tracking-wider">Save Management</h3>
                    <div className="flex gap-2 items-center">
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
                                if (window.electronAPI) {
                                    await window.electronAPI.openServerFolder();
                                }
                            }}
                            className="flex items-center gap-2 px-3 py-1.5 text-xs font-medium text-text-muted hover:text-text bg-surface-hover hover:bg-border rounded-md transition-colors"
                        >
                            <FolderOpen size={14} />
                            Server Folder
                        </motion.button>
                        <motion.button
                            whileHover={{ scale: 1.05 }}
                            whileTap={{ scale: 0.95 }}
                            onClick={async () => {
                                if (window.electronAPI) {
                                    await window.electronAPI.openSavesFolder();
                                }
                            }}
                            className="flex items-center gap-2 px-3 py-1.5 text-xs font-medium text-text-muted hover:text-text bg-surface-hover hover:bg-border rounded-md transition-colors"
                        >
                            <FolderOpen size={14} />
                            Saves Folder
                        </motion.button>

                        <motion.button
                            whileHover={{ scale: 1.05 }}
                            whileTap={{ scale: 0.95 }}
                            onClick={() => {
                                if (!window.electronAPI) {
                                    return;
                                }

                                setConfirmation({
                                    isOpen: true,
                                    title: 'Backup All Saves?',
                                    message: 'Are you sure you want to backup all multiplayer saves?',
                                    confirmText: 'Backup',
                                    confirmColor: 'bg-success',
                                    onConfirm: async () => {
                                        const result = await window.electronAPI.backupSaves();
                                        if (result.success) {
                                            toast.success(`Backup created at: ${result.path}`);
                                        } else {
                                            toast.error(`Backup failed: ${result.error}`);
                                        }
                                    }
                                });
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

const SaveList = () => {
    const [saves, setSaves] = useState([]);
    const [loading, setLoading] = useState(false);
    const toast = useToast();
    const [confirmation, setConfirmation] = useState({ isOpen: false, title: '', message: '', onConfirm: () => { }, confirmText: 'Confirm', confirmColor: 'bg-primary' });

    const loadSaves = async () => {
        if (!window.electronAPI) {
            return;
        }

        setLoading(true);
        const list = await window.electronAPI.getSaves();
        setSaves(list);
        setLoading(false);
    };

    useEffect(() => {
        loadSaves();
    }, []);

    const handleDelete = async (saveName) => {
        setConfirmation({
            isOpen: true,
            title: 'Delete Save?',
            message: `Are you sure you want to delete save "${saveName}"? This is irreversible.`,
            confirmText: 'Delete',
            confirmColor: 'bg-error',
            onConfirm: async () => {
                if (!window.electronAPI) {
                    return;
                }

                const success = await window.electronAPI.deleteSave(saveName);
                if (success) {
                    toast.success(`Save "${saveName}" deleted.`);
                    loadSaves();
                } else {
                    toast.error('Failed to delete save.');
                }
            }
        });
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
                        {saves.map((save) => (
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

export default Dashboard;
