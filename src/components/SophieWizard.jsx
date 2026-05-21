import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Download, FolderOpen, CheckCircle, ArrowRight, BookOpen, AlertCircle, X, FileText, FileCode, Settings, FileJson } from 'lucide-react';
import clsx from 'clsx';

const SophieWizard = ({ isOpen, onClose, onComplete }) => {
    const [step, setStep] = useState(0);
    const [progress, setProgress] = useState({ status: '', percent: 0 });
    const [installing, setInstalling] = useState(false);
    const [error, setError] = useState(null);
    const [modIds, setModIds] = useState([]);
    const [installedFiles, setInstalledFiles] = useState([]);

    // Reset state when opened
    useEffect(() => {
        if (isOpen) {
            setStep(0);
            setProgress({ status: '', percent: 0 });
            setInstalling(false);
            setError(null);
            setModIds([]);
        }
    }, [isOpen]);

    const handleInstall = async () => {
        setInstalling(true);
        setError(null);
        setStep(1);

        try {
            // 1. Install Preset
            setProgress({ status: 'Downloading Sophie Preset...', percent: 10 });
            const presetResult = await window.electronAPI.installSophiePreset();

            if (!presetResult.success) {
                throw new Error(presetResult.error || 'Failed to install preset');
            }

            const ids = presetResult.modIds || [];
            setModIds(ids);
            setInstalledFiles(presetResult.installedFiles || []);

            // 2. Install Mods to Client (for In-Game Host)
            if (ids.length > 0) {
                setProgress({ status: `Installing ${ids.length} mods to Client...`, percent: 50 });

                // We listen to progress events from the backend via the existing listener in Dashboard or a new one here?
                // The backend sends 'sophie:progress'. We need to hook into that.
                // But we can't easily hook into the global listener from here without passing it down or adding another one.
                // Let's rely on the backend sending progress updates which we can capture if we add a listener.

                const removeListener = window.electronAPI.onSophieProgress((p) => {
                    setProgress(p);
                });

                await window.electronAPI.installModsToClient(ids);
                removeListener();
            }

            setProgress({ status: 'Installation Complete!', percent: 100 });
            setTimeout(() => {
                setInstalling(false);
                setStep(2);
                if (onComplete) onComplete();
            }, 1000);

        } catch (err) {
            console.error(err);
            setError(err.message);
            setInstalling(false);
        }
    };

    if (!isOpen) return null;

    const steps = [
        { title: 'Welcome', icon: BookOpen },
        { title: 'Installation', icon: Download },
        { title: 'Files', icon: FolderOpen },
        { title: 'How to Host', icon: CheckCircle }
    ];

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm p-4">
            <motion.div
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
                exit={{ opacity: 0, scale: 0.95 }}
                className="bg-surface border border-border rounded-xl shadow-2xl w-full max-w-2xl overflow-hidden flex flex-col max-h-[90vh]"
            >
                {/* Header */}
                <div className="bg-surface-hover p-4 border-b border-border flex justify-between items-center">
                    <h2 className="text-lg font-bold text-text flex items-center gap-2">
                        <Download size={20} className="text-primary" />
                        Sophie Mod Pack Installer
                    </h2>
                    <button onClick={onClose} className="text-text-muted hover:text-text transition-colors">
                        <X size={20} />
                    </button>
                </div>

                {/* Progress Stepper */}
                <div className="px-8 py-4 flex justify-between items-center relative">
                    <div className="absolute left-8 right-8 top-1/2 h-0.5 bg-border -z-10" />
                    {steps.map((s, i) => (
                        <div key={i} className="flex flex-col items-center gap-2 bg-surface px-2">
                            <div className={clsx(
                                "w-8 h-8 rounded-full flex items-center justify-center text-xs font-bold transition-colors duration-300",
                                i < step ? "bg-success text-white" :
                                    i === step ? "bg-primary text-white" : "bg-border text-text-muted"
                            )}>
                                {i < step ? <CheckCircle size={14} /> : i + 1}
                            </div>
                            <span className={clsx("text-xs font-medium", i === step ? "text-primary" : "text-text-muted")}>{s.title}</span>
                        </div>
                    ))}
                </div>

                {/* Content */}
                <div className="p-8 flex-1 overflow-y-auto">
                    <AnimatePresence mode="wait">
                        {step === 0 && (
                            <motion.div key="step0" initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: -20 }} className="space-y-4 text-center">
                                <div className="w-20 h-20 bg-primary/10 rounded-full flex items-center justify-center text-primary mx-auto mb-4">
                                    <Download size={40} />
                                </div>
                                <h3 className="text-2xl font-bold text-text">Ready to Install?</h3>
                                <p className="text-text-muted max-w-md mx-auto">
                                    This wizard will download the <b>Sophie Mod Pack</b>, configure your server settings, and automatically install all required mods to your Steam Client so you can host immediately.
                                </p>
                                <div className="bg-surface-hover p-4 rounded-lg text-left text-sm text-text-dim space-y-2 max-w-md mx-auto border border-border">
                                    <p>• Downloads Preset Configs (Ini, Lua, Sandbox)</p>
                                    <p>• Downloads & Installs Mods via SteamCMD</p>
                                    <p>• Updates your Steam Workshop ACF file</p>
                                </div>
                            </motion.div>
                        )}

                        {step === 1 && (
                            <motion.div key="step1" initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: -20 }} className="space-y-6 text-center">
                                <h3 className="text-xl font-bold text-text">Installing...</h3>

                                <div className="space-y-2">
                                    <div className="flex justify-between text-sm text-text-muted">
                                        <span>{progress.status}</span>
                                        <span>{progress.percent}%</span>
                                    </div>
                                    <div className="w-full bg-background rounded-full h-4 overflow-hidden border border-border">
                                        <motion.div
                                            className="bg-primary h-full"
                                            initial={{ width: 0 }}
                                            animate={{ width: `${progress.percent}%` }}
                                            transition={{ duration: 0.3 }}
                                        />
                                    </div>
                                </div>

                                {error && (
                                    <div className="bg-error/10 border border-error/20 p-4 rounded-lg text-error text-sm flex items-center gap-2 justify-center">
                                        <AlertCircle size={16} />
                                        <span>{error}</span>
                                    </div>
                                )}
                            </motion.div>
                        )}

                        {step === 2 && (
                            <motion.div key="step2" initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: -20 }} className="space-y-6">
                                <div className="text-center">
                                    <div className="w-16 h-16 bg-success/10 rounded-full flex items-center justify-center text-success mx-auto mb-4">
                                        <CheckCircle size={32} />
                                    </div>
                                    <h3 className="text-xl font-bold text-text">Installation Successful!</h3>
                                    <p className="text-text-muted">All files have been placed in your <span className="text-primary font-mono bg-primary/10 px-1 rounded">Zomboid</span> folder.</p>
                                </div>

                                <div className="space-y-4 max-h-60 overflow-y-auto pr-2">
                                    {installedFiles.length > 0 ? (
                                        Object.entries(installedFiles.reduce((acc, file) => {
                                            const parts = file.split(/[/\\]/);
                                            const folder = parts.length > 1 ? parts[0] : 'Root';
                                            if (!acc[folder]) acc[folder] = [];
                                            acc[folder].push(file);
                                            return acc;
                                        }, {})).map(([folder, files]) => (
                                            <div key={folder} className="space-y-2">
                                                <h4 className="text-xs font-bold text-text-muted uppercase tracking-wider flex items-center gap-2">
                                                    <FolderOpen size={12} />
                                                    {folder}
                                                </h4>
                                                <div className="space-y-2 pl-2 border-l-2 border-border ml-1">
                                                    {files.map((file, index) => {
                                                        let Icon = FileText;
                                                        let color = "text-text-muted";

                                                        if (file.endsWith('.ini')) { Icon = Settings; color = "text-blue-400"; }
                                                        else if (file.endsWith('.lua')) { Icon = FileCode; color = "text-yellow-400"; }
                                                        else if (file.endsWith('.json')) { Icon = FileJson; color = "text-green-400"; }

                                                        return (
                                                            <div key={index} className="bg-surface-hover p-2 rounded-lg border border-border flex items-center justify-between">
                                                                <div className="flex items-center gap-3 overflow-hidden">
                                                                    <Icon size={16} className={clsx(color, "shrink-0")} />
                                                                    <div className="overflow-hidden">
                                                                        <p className="text-sm font-medium text-text truncate" title={file}>{file.split(/[/\\]/).pop()}</p>
                                                                    </div>
                                                                </div>
                                                                <button onClick={() => window.electronAPI.openConfigFolder()} className="text-[10px] bg-surface border border-border px-2 py-0.5 rounded hover:text-primary transition-colors shrink-0">Open</button>
                                                            </div>
                                                        );
                                                    })}
                                                </div>
                                            </div>
                                        ))
                                    ) : (
                                        <p className="text-center text-text-muted text-sm">No files listed.</p>
                                    )}
                                </div>
                            </motion.div>
                        )}

                        {step === 3 && (
                            <motion.div key="step3" initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: -20 }} className="space-y-6">
                                <div className="text-center">
                                    <h3 className="text-xl font-bold text-text">How to Host</h3>
                                    <p className="text-text-muted">Follow these steps to start your co-op game.</p>
                                </div>

                                <div className="space-y-4 text-sm text-text-dim">
                                    <div className="flex gap-4 items-start">
                                        <div className="w-6 h-6 rounded-full bg-primary/20 text-primary flex items-center justify-center shrink-0 font-bold text-xs">1</div>
                                        <p>Launch <b>Project Zomboid</b> via Steam.</p>
                                    </div>
                                    <div className="flex gap-4 items-start">
                                        <div className="w-6 h-6 rounded-full bg-primary/20 text-primary flex items-center justify-center shrink-0 font-bold text-xs">2</div>
                                        <p>In the main menu, click <b>Host</b>.</p>
                                    </div>
                                    <div className="flex gap-4 items-start">
                                        <div className="w-6 h-6 rounded-full bg-primary/20 text-primary flex items-center justify-center shrink-0 font-bold text-xs">3</div>
                                        <p>Click <b>Manage Settings</b> &rarr; Select <b>"Sophie"</b> &rarr; Click <b>Edit Selected Settings</b> (Optional, to verify) &rarr; <b>Save</b>.</p>
                                    </div>
                                    <div className="flex gap-4 items-start">
                                        <div className="w-6 h-6 rounded-full bg-primary/20 text-primary flex items-center justify-center shrink-0 font-bold text-xs">4</div>
                                        <p>Back in the Host menu, ensure <b>"Sophie"</b> is selected in the "Server Settings" dropdown.</p>
                                    </div>
                                    <div className="flex gap-4 items-start">
                                        <div className="w-6 h-6 rounded-full bg-primary/20 text-primary flex items-center justify-center shrink-0 font-bold text-xs">5</div>
                                        <p>Click <b>Host Game</b>. The game will launch with all mods pre-loaded!</p>
                                    </div>
                                </div>

                                <div className="bg-primary/10 border border-primary/20 p-4 rounded-lg flex gap-3 items-start">
                                    <AlertCircle size={18} className="text-primary shrink-0 mt-0.5" />
                                    <p className="text-xs text-primary">
                                        <b>Note:</b> Since we updated your Steam ACF file, you should NOT see any "Workshop item version different" errors. If you do, restart Steam.
                                    </p>
                                </div>
                            </motion.div>
                        )}
                    </AnimatePresence>
                </div>

                {/* Footer Actions */}
                <div className="p-4 border-t border-border bg-surface-hover flex justify-end gap-3">
                    {step === 0 && (
                        <button
                            onClick={handleInstall}
                            className="px-6 py-2 bg-primary text-white rounded-md hover:bg-primary-hover transition-colors font-medium flex items-center gap-2"
                        >
                            Start Installation <ArrowRight size={16} />
                        </button>
                    )}
                    {step === 1 && (
                        <button disabled className="px-6 py-2 bg-primary/50 text-white/50 rounded-md cursor-not-allowed font-medium">
                            Installing...
                        </button>
                    )}
                    {step === 2 && (
                        <button
                            onClick={() => setStep(3)}
                            className="px-6 py-2 bg-primary text-white rounded-md hover:bg-primary-hover transition-colors font-medium flex items-center gap-2"
                        >
                            Next: Instructions <ArrowRight size={16} />
                        </button>
                    )}
                    {step === 3 && (
                        <button
                            onClick={onClose}
                            className="px-6 py-2 bg-success text-white rounded-md hover:bg-success-hover transition-colors font-medium flex items-center gap-2"
                        >
                            Finish <CheckCircle size={16} />
                        </button>
                    )}
                </div>
            </motion.div>
        </div>
    );
};

export default SophieWizard;
