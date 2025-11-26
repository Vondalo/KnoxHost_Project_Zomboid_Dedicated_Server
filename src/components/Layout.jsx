import React, { useState, useEffect } from 'react';
import { Outlet, NavLink, useLocation, useOutlet } from 'react-router-dom';
import { LayoutDashboard, Settings, Package, Users, Menu } from 'lucide-react';
import { motion, AnimatePresence, useMotionValue, useTransform, animate } from 'framer-motion';
import CustomCursor from './CustomCursor';

const Layout = () => {
    const location = useLocation();
    const [isSidebarOpen, setIsSidebarOpen] = useState(true);
    const currentOutlet = useOutlet();

    return (
        <div className="flex h-screen bg-transparent text-text font-sans overflow-hidden selection:bg-primary/30 selection:text-white">
            <CustomCursor />
            <InteractiveBackground />

            {/* Sidebar */}
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
                    <NavItem to="/config" icon={<Settings size={20} />} label="Configuration" isOpen={isSidebarOpen} />
                    <NavItem to="/mods" icon={<Package size={20} />} label="Mods Manager" isOpen={isSidebarOpen} />
                    <NavItem to="/whitelist" icon={<Users size={20} />} label="Whitelist" isOpen={isSidebarOpen} />
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

            {/* Main Content */}
            <div className="flex-1 flex flex-col min-w-0 bg-transparent relative z-10">
                {/* Title Bar */}
                <header className="h-12 bg-surface/30 backdrop-blur-md border-b border-border flex items-center justify-between px-4 shrink-0 drag-region">
                    <div className="text-xs text-text-muted font-mono uppercase tracking-wider">
                        {location.pathname === '/' ? 'Dashboard' : location.pathname.slice(1).replace('-', ' ')}
                    </div>
                </header>

                {/* Page Content */}
                <main className="flex-1 overflow-auto p-6 relative">
                    <AnimatePresence mode="wait">
                        <motion.div
                            key={location.pathname}
                            initial={{ opacity: 0, y: 10, scale: 0.98 }}
                            animate={{ opacity: 1, y: 0, scale: 1 }}
                            exit={{ opacity: 0, y: -10, scale: 0.98 }}
                            transition={{ duration: 0.2, ease: "easeOut" }}
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
            {/* Grid Pattern */}
            <div className="absolute inset-0 bg-[linear-gradient(rgba(255,255,255,0.05)_1px,transparent_1px),linear-gradient(90deg,rgba(255,255,255,0.05)_1px,transparent_1px)] bg-[size:40px_40px] [mask-image:radial-gradient(ellipse_at_center,black_60%,transparent_100%)]" />

            {/* Floating Spores/Dust with Repulsion */}
            {[...Array(40)].map((_, i) => (
                <Particle key={i} mouseX={mouseX} mouseY={mouseY} />
            ))}
        </div>
    );
};

const Particle = ({ mouseX, mouseY }) => {
    const initialX = Math.random() * window.innerWidth;
    const initialY = Math.random() * window.innerHeight;

    // Create motion values for the particle's base animation position
    const baseX = useMotionValue(initialX);
    const baseY = useMotionValue(initialY);

    // Animate base position randomly
    useEffect(() => {
        const controls = animate(baseX, [initialX - 50, initialX + 50], {
            duration: Math.random() * 10 + 10,
            repeat: Infinity,
            repeatType: "reverse",
            ease: "easeInOut"
        });
        const controlsY = animate(baseY, [initialY - 50, initialY + 50], {
            duration: Math.random() * 10 + 10,
            repeat: Infinity,
            repeatType: "reverse",
            ease: "easeInOut"
        });
        return () => { controls.stop(); controlsY.stop(); };
    }, [baseX, baseY, initialX, initialY]);

    // Calculate repulsion
    const x = useTransform([baseX, mouseX, mouseY], ([bx, mx, my]) => {
        const dx = bx - mx;
        const dy = baseY.get() - my;
        const distance = Math.sqrt(dx * dx + dy * dy);
        const maxDist = 200;
        if (distance < maxDist) {
            const force = (maxDist - distance) / maxDist;
            return bx + (dx / distance) * force * 50; // Push away by up to 50px
        }
        return bx;
    });

    const y = useTransform([baseY, mouseX, mouseY], ([by, mx, my]) => {
        const dx = baseX.get() - mx;
        const dy = by - my;
        const distance = Math.sqrt(dx * dx + dy * dy);
        const maxDist = 200;
        if (distance < maxDist) {
            const force = (maxDist - distance) / maxDist;
            return by + (dy / distance) * force * 50;
        }
        return by;
    });

    return (
        <motion.div
            className="absolute w-1 h-1 bg-primary/40 rounded-full blur-[1px]"
            style={{ x, y }}
            initial={{ opacity: 0 }}
            animate={{ opacity: [0.2, 0.5, 0.2] }}
            transition={{
                duration: Math.random() * 5 + 5,
                repeat: Infinity,
                repeatType: "reverse",
                ease: "easeInOut"
            }}
        />
    );
};

export default Layout;
