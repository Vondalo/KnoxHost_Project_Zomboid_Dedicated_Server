import React, { useEffect, useState } from 'react';
import { Outlet, NavLink, useLocation, useOutlet } from 'react-router-dom';
import { LayoutDashboard, Settings, Package, Users, Menu, RefreshCw, ArrowUpCircle } from 'lucide-react';
import { useToast } from '../context/ToastContext';
import { motion, AnimatePresence, useMotionValue, useTransform, animate } from 'framer-motion';
import CustomCursor from './CustomCursor';
import { subscribeToSettingsChanged } from '../lib/appSettings';

const DEFAULT_APP_SETTINGS = {
    enableDedicatedServer: false,
    uiEffectsEnabled: true
};

const Layout = () => {
    const location = useLocation();
    const currentOutlet = useOutlet();
    const toast = useToast();
    const [isSidebarOpen, setIsSidebarOpen] = useState(true);
    const [updateStatus, setUpdateStatus] = useState('idle');
    const [downloadProgress, setDownloadProgress] = useState(0);
    const [appSettings, setAppSettings] = useState(DEFAULT_APP_SETTINGS);

    useEffect(() => {
        if (!window.electronAPI) {
            return;
        }

        let isMounted = true;
        window.electronAPI.getSettings().then((settings) => {
            if (isMounted) {
                setAppSettings((prev) => ({ ...prev, ...settings }));
            }
        });

        const unsubscribe = subscribeToSettingsChanged((settings) => {
            setAppSettings((prev) => ({ ...prev, ...settings }));
        });

        return () => {
            isMounted = false;
            unsubscribe();
        };
    }, []);

    useEffect(() => {
        const effectsEnabled = appSettings.uiEffectsEnabled !== false;
        document.body.classList.toggle('effects-enabled', effectsEnabled);

        return () => {
            document.body.classList.remove('effects-enabled');
        };
    }, [appSettings.uiEffectsEnabled]);

    useEffect(() => {
        if (!window.electronAPI) {
            return;
        }

        const cleanupStatus = window.electronAPI.onUpdaterStatus((msg) => {
            console.log('Updater:', msg);
        });

        const cleanupAvailable = window.electronAPI.onUpdateAvailable((info) => {
            setUpdateStatus('available');
            toast.info(`Update available: ${info.version}. Downloading...`);
        });

        const cleanupNotAvailable = window.electronAPI.onUpdateNotAvailable(() => {
            setUpdateStatus('idle');
            toast.success('You are on the latest version.');
        });

        const cleanupProgress = window.electronAPI.onDownloadProgress((progressObj) => {
            setUpdateStatus('downloading');
            setDownloadProgress(progressObj.percent);
        });

        const cleanupDownloaded = window.electronAPI.onUpdateDownloaded(() => {
            setUpdateStatus('downloaded');
            toast.success('Update downloaded. Click to restart.');
        });

        const cleanupError = window.electronAPI.onUpdaterError((err) => {
            setUpdateStatus('idle');
            toast.error(`Update error: ${err}`);
        });

        return () => {
            cleanupStatus();
            cleanupAvailable();
            cleanupNotAvailable();
            cleanupProgress();
            cleanupDownloaded();
            cleanupError();
        };
    }, [toast]);

    const handleCheckUpdate = () => {
        setUpdateStatus('checking');
        toast.info('Checking for updates...');
        window.electronAPI.checkForUpdates();
    };

    const handleRestart = () => {
        window.electronAPI.quitAndInstall();
    };

    const isDedicatedMode = appSettings.enableDedicatedServer || false;
    const uiEffectsEnabled = appSettings.uiEffectsEnabled !== false;

    return (
        <div className="flex h-screen bg-transparent text-text font-sans overflow-hidden selection:bg-primary/30 selection:text-white">
            {uiEffectsEnabled && <CustomCursor />}
            {uiEffectsEnabled && <InteractiveBackground />}

            <motion.aside
                initial={{ x: -20, opacity: 0 }}
                animate={{ x: 0, opacity: 1 }}
                className={`bg-surface/90 backdrop-blur-md border-r border-border flex flex-col transition-all duration-300 z-20 ${isSidebarOpen ? 'w-64' : 'w-20'}`}
            >
                <div className="h-12 flex items-center px-6 border-b border-border shrink-0">
                    <div className="flex items-center gap-3 overflow-hidden">
                        <div className="w-8 h-8 bg-primary/20 rounded-md flex items-center justify-center shrink-0">
                            <span className="text-primary font-bold">PZ</span>
                        </div>
                        <span className={`font-bold text-lg tracking-tight whitespace-nowrap transition-opacity duration-300 ${isSidebarOpen ? 'opacity-100' : 'opacity-0'}`}>
                            SERVER CREATOR
                        </span>
                    </div>
                </div>

                <nav className="flex-1 p-4 space-y-2 overflow-y-auto">
                    <NavItem to="/" icon={<LayoutDashboard size={20} />} label="Dashboard" isOpen={isSidebarOpen} />
                    {isDedicatedMode && <NavItem to="/admin" icon={<Users size={20} />} label="Admin Panel" isOpen={isSidebarOpen} />}
                    <NavItem to="/config" icon={<Settings size={20} />} label="Configuration" isOpen={isSidebarOpen} />
                    <NavItem to="/mods" icon={<Package size={20} />} label="Mods Manager" isOpen={isSidebarOpen} />
                    {isDedicatedMode && <NavItem to="/whitelist" icon={<Users size={20} />} label="Whitelist" isOpen={isSidebarOpen} />}
                    <NavItem to="/settings" icon={<Settings size={20} />} label="Settings" isOpen={isSidebarOpen} />
                </nav>

                <div className="p-4 border-t border-border shrink-0">
                    <button
                        onClick={() => setIsSidebarOpen(!isSidebarOpen)}
                        className="w-full flex items-center justify-center p-2 text-text-muted hover:text-text hover:bg-surface-hover rounded-md transition-colors"
                    >
                        <Menu size={20} />
                    </button>
                </div>
            </motion.aside>

            <div className="flex-1 flex flex-col min-w-0 bg-transparent relative z-10">
                <header className="h-12 bg-surface/30 backdrop-blur-md border-b border-border flex items-center justify-between px-4 shrink-0 drag-region">
                    <div className="text-xs text-text-muted font-mono uppercase tracking-wider">
                        {location.pathname === '/' ? 'Dashboard' : location.pathname.slice(1).replace('-', ' ')}
                    </div>

                    <div className="flex items-center gap-2">
                        {updateStatus === 'downloaded' ? (
                            <button
                                onClick={handleRestart}
                                className="flex items-center gap-2 px-3 py-1.5 bg-green-500/10 text-green-500 hover:bg-green-500/20 rounded-md text-sm font-medium transition-colors border border-green-500/20"
                            >
                                <ArrowUpCircle size={16} />
                                <span>Restart to Update</span>
                            </button>
                        ) : (
                            <button
                                onClick={handleCheckUpdate}
                                disabled={updateStatus === 'checking' || updateStatus === 'downloading'}
                                className={`flex items-center gap-2 px-3 py-1.5 bg-surface text-text-muted hover:text-text hover:bg-surface-hover rounded-md text-sm font-medium transition-colors border border-border ${(updateStatus === 'checking' || updateStatus === 'downloading') ? 'opacity-50 cursor-not-allowed' : ''}`}
                            >
                                <RefreshCw size={16} className={updateStatus === 'checking' || updateStatus === 'downloading' ? 'animate-spin' : ''} />
                                <span>
                                    {updateStatus === 'downloading'
                                        ? `Downloading ${Math.round(downloadProgress)}%`
                                        : updateStatus === 'checking'
                                            ? 'Checking...'
                                            : 'Check Updates'}
                                </span>
                            </button>
                        )}
                    </div>
                </header>

                <main className="flex-1 overflow-auto p-6 relative">
                    <AnimatePresence mode="wait">
                        <motion.div
                            key={location.pathname}
                            initial={{ opacity: 0, y: 10, scale: 0.98 }}
                            animate={{ opacity: 1, y: 0, scale: 1 }}
                            exit={{ opacity: 0, y: -10, scale: 0.98 }}
                            transition={{ duration: 0.2, ease: 'easeOut' }}
                            className="h-full"
                        >
                            {currentOutlet}
                        </motion.div>
                    </AnimatePresence>
                </main>
            </div>
        </div>
    );
};

const NavItem = ({ to, icon, label, isOpen }) => (
    <NavLink
        to={to}
        className={({ isActive }) => `
            flex items-center gap-3 px-3 py-2.5 rounded-md transition-all duration-200 group relative overflow-hidden
            ${isActive
                ? 'bg-primary/10 text-primary border border-primary/20 shadow-[0_0_15px_rgba(244,63,94,0.1)]'
                : 'text-text-muted hover:text-text hover:bg-surface-hover border border-transparent'
            }
        `}
    >
        <span className="relative z-10 shrink-0">{icon}</span>
        <span className={`font-medium relative z-10 whitespace-nowrap transition-all duration-300 ${isOpen ? 'opacity-100 translate-x-0' : 'opacity-0 -translate-x-4 absolute left-12'}`}>
            {label}
        </span>
        {!isOpen && (
            <div className="absolute left-14 bg-surface border border-border px-2 py-1 rounded text-xs text-text opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none whitespace-nowrap z-50 shadow-lg">
                {label}
            </div>
        )}
    </NavLink>
);

const InteractiveBackground = () => {
    const mouseX = useMotionValue(0);
    const mouseY = useMotionValue(0);
    const [particles] = useState(() => (
        Array.from({ length: 18 }, () => ({
            x: Math.random(),
            y: Math.random(),
            drift: Math.random()
        }))
    ));

    useEffect(() => {
        const handleMouseMove = (e) => {
            mouseX.set(e.clientX);
            mouseY.set(e.clientY);
        };

        window.addEventListener('mousemove', handleMouseMove);
        return () => window.removeEventListener('mousemove', handleMouseMove);
    }, [mouseX, mouseY]);

    return (
        <div className="fixed inset-0 pointer-events-none z-0 overflow-hidden bg-background">
            <div className="absolute inset-0 bg-[linear-gradient(rgba(255,255,255,0.05)_1px,transparent_1px),linear-gradient(90deg,rgba(255,255,255,0.05)_1px,transparent_1px)] bg-[size:40px_40px] [mask-image:radial-gradient(ellipse_at_center,black_60%,transparent_100%)]" />
            {particles.map((seed, index) => (
                <Particle key={index} mouseX={mouseX} mouseY={mouseY} seed={seed} />
            ))}
        </div>
    );
};

const Particle = ({ mouseX, mouseY, seed }) => {
    const viewportWidth = typeof window === 'undefined' ? 1200 : window.innerWidth;
    const viewportHeight = typeof window === 'undefined' ? 800 : window.innerHeight;
    const initialX = seed.x * viewportWidth;
    const initialY = seed.y * viewportHeight;
    const baseX = useMotionValue(initialX);
    const baseY = useMotionValue(initialY);

    useEffect(() => {
        const offset = 25 + seed.drift * 35;
        const duration = 12 + seed.drift * 8;
        const controlsX = animate(baseX, [initialX - offset, initialX + offset], {
            duration,
            repeat: Infinity,
            repeatType: 'reverse',
            ease: 'easeInOut'
        });
        const controlsY = animate(baseY, [initialY - offset, initialY + offset], {
            duration: duration + 2,
            repeat: Infinity,
            repeatType: 'reverse',
            ease: 'easeInOut'
        });

        return () => {
            controlsX.stop();
            controlsY.stop();
        };
    }, [baseX, baseY, initialX, initialY, seed.drift]);

    const x = useTransform([baseX, mouseX, mouseY], ([bx, mx, my]) => {
        const dx = bx - mx;
        const dy = baseY.get() - my;
        const distance = Math.sqrt(dx * dx + dy * dy) || 1;
        const maxDist = 180;

        if (distance < maxDist) {
            const force = (maxDist - distance) / maxDist;
            return bx + (dx / distance) * force * 30;
        }

        return bx;
    });

    const y = useTransform([baseY, mouseX, mouseY], ([by, mx, my]) => {
        const dx = baseX.get() - mx;
        const dy = by - my;
        const distance = Math.sqrt(dx * dx + dy * dy) || 1;
        const maxDist = 180;

        if (distance < maxDist) {
            const force = (maxDist - distance) / maxDist;
            return by + (dy / distance) * force * 30;
        }

        return by;
    });

    return (
        <motion.div
            className="absolute w-1 h-1 bg-primary/30 rounded-full blur-[1px]"
            style={{ x, y }}
            animate={{ opacity: [0.15, 0.35, 0.15] }}
            transition={{
                duration: 6 + seed.drift * 4,
                repeat: Infinity,
                repeatType: 'reverse',
                ease: 'easeInOut'
            }}
        />
    );
};

export default Layout;
