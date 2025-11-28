import React, { useState, useEffect } from 'react';
import { Users, Shield, MessageSquare, Zap, Crosshair, CloudRain, Sun, Radio, Save, LogOut, Search, UserX, Ban, Unlock, Gift, Truck, Eye, EyeOff, RefreshCw, MapPin, Database, Hammer } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import clsx from 'clsx';
import { useToast } from '../context/ToastContext';
import ConfirmationModal from '../components/ConfirmationModal';
import SkillManager from '../components/admin/SkillManager';
import BanManager from '../components/admin/BanManager';
import ItemSpawner from '../components/admin/ItemSpawner';

const Admin = () => {
    const [players, setPlayers] = useState([]);
    const [selectedPlayer, setSelectedPlayer] = useState(null);
    const [searchTerm, setSearchTerm] = useState('');
    const [loading, setLoading] = useState(false);
    const [actionLoading, setActionLoading] = useState(false);
    const [broadcastMsg, setBroadcastMsg] = useState('');
    const [activeTab, setActiveTab] = useState('overview'); // overview, skills, items, bans

    // Modal State
    const [modal, setModal] = useState({ isOpen: false, title: '', message: '', onConfirm: () => { }, confirmText: 'Confirm', confirmColor: 'bg-primary' });
    const [inputModal, setInputModal] = useState({ isOpen: false, title: '', label: '', value: '', onConfirm: () => { } });

    const toast = useToast();

    useEffect(() => {
        fetchPlayers();
        const interval = setInterval(fetchPlayers, 5000); // Poll every 5s
        return () => clearInterval(interval);
    }, []);

    const fetchPlayers = async () => {
        if (window.electronAPI) {
            const list = await window.electronAPI.getPlayers();
            setPlayers(list);
        }
    };

    const handleAction = async (actionName, actionFn, confirmMsg = null) => {
        if (!window.electronAPI) return;

        const execute = async (...args) => {
            setActionLoading(true);
            try {
                await actionFn(...args);
                toast.success(`${actionName} command sent.`);
            } catch (err) {
                console.error(err);
                toast.error(`Failed to execute ${actionName}.`);
            } finally {
                setActionLoading(false);
            }
        };

        if (confirmMsg) {
            setModal({
                isOpen: true,
                title: `Confirm ${actionName}`,
                message: confirmMsg,
                confirmText: actionName,
                confirmColor: 'bg-primary',
                onConfirm: () => execute()
            });
        } else {
            execute();
        }
    };

    const handlePlayerAction = async (actionName, actionFn, needsInput = false, inputLabel = '') => {
        if (!selectedPlayer) return;

        if (needsInput) {
            setInputModal({
                isOpen: true,
                title: `${actionName} ${selectedPlayer}`,
                label: inputLabel,
                value: '',
                onConfirm: (val) => {
                    handleAction(actionName, () => actionFn(selectedPlayer, val));
                    setInputModal(prev => ({ ...prev, isOpen: false }));
                }
            });
        } else {
            handleAction(actionName, () => actionFn(selectedPlayer), `Are you sure you want to ${actionName.toLowerCase()} ${selectedPlayer}?`);
        }
    };

    const handleTeleport = () => {
        if (!selectedPlayer) return;
        setInputModal({
            isOpen: true,
            title: `Teleport ${selectedPlayer} to...`,
            label: "Target player or x,y,z (e.g. 10800,10000,0)",
            value: '',
            onConfirm: async (target) => {
                if (!target) return;
                setActionLoading(true);
                try {
                    // Check if target is coordinates
                    if (target.includes(',')) {
                        const [x, y, z] = target.split(',').map(n => n.trim());
                        await window.electronAPI.teleportToCoords(selectedPlayer, x, y, z || 0);
                        toast.success(`Teleported ${selectedPlayer} to ${x},${y},${z}`);
                    } else {
                        await window.electronAPI.teleportPlayer(selectedPlayer, target);
                        toast.success(`Teleported ${selectedPlayer} to ${target}`);
                    }
                } catch (err) {
                    toast.error('Failed to teleport player');
                } finally {
                    setActionLoading(false);
                    setInputModal(prev => ({ ...prev, isOpen: false }));
                }
            }
        });
    };

    const filteredPlayers = players.filter(p => p.toLowerCase().includes(searchTerm.toLowerCase()));

    return (
        <div className="h-full flex gap-6">
            {/* Left Panel: Player List */}
            <div className="w-64 flex flex-col bg-surface border border-border rounded-lg overflow-hidden shadow-sm shrink-0">
                <div className="p-4 border-b border-border bg-surface-hover/50">
                    <h2 className="text-sm font-medium text-text uppercase tracking-wider mb-3 flex items-center gap-2">
                        <Users size={16} className="text-primary" />
                        Online Players ({players.length})
                    </h2>
                    <div className="relative">
                        <Search className="absolute left-2.5 top-1/2 -translate-y-1/2 text-text-muted" size={14} />
                        <input
                            type="text"
                            placeholder="Search players..."
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            className="w-full bg-background border border-border rounded-md pl-8 pr-3 py-1.5 text-xs text-text focus:outline-none focus:ring-1 focus:ring-primary"
                        />
                    </div>
                </div>

                <div className="flex-1 overflow-y-auto p-2 space-y-1">
                    {filteredPlayers.length === 0 ? (
                        <div className="text-center py-8 text-text-muted text-xs">
                            {players.length === 0 ? "No players online." : "No matches found."}
                        </div>
                    ) : (
                        filteredPlayers.map(player => (
                            <button
                                key={player}
                                onClick={() => setSelectedPlayer(player)}
                                className={clsx(
                                    "w-full text-left px-3 py-2 rounded-md text-sm transition-colors flex items-center gap-2",
                                    selectedPlayer === player ? "bg-primary/10 text-primary border border-primary/20" : "text-text hover:bg-surface-hover"
                                )}
                            >
                                <div className={clsx("w-2 h-2 rounded-full", selectedPlayer === player ? "bg-primary" : "bg-success")} />
                                {player}
                            </button>
                        ))
                    )}
                </div>

                <div className="p-2 border-t border-border bg-surface-hover/30">
                    <button
                        onClick={fetchPlayers}
                        className="w-full flex items-center justify-center gap-2 py-1.5 text-xs text-text-muted hover:text-text bg-surface hover:bg-border rounded transition-colors"
                    >
                        <RefreshCw size={12} /> Refresh List
                    </button>
                </div>
            </div>

            {/* Main Panel */}
            <div className="flex-1 flex flex-col overflow-hidden">
                {/* Tabs */}
                <div className="flex items-center gap-1 mb-4 border-b border-border">
                    <TabButton active={activeTab === 'overview'} onClick={() => setActiveTab('overview')} icon={Shield} label="Overview" />
                    <TabButton active={activeTab === 'skills'} onClick={() => setActiveTab('skills')} icon={Zap} label="Skills & XP" />
                    <TabButton active={activeTab === 'items'} onClick={() => setActiveTab('items')} icon={Gift} label="Items & Vehicles" />
                    <TabButton active={activeTab === 'bans'} onClick={() => setActiveTab('bans')} icon={UserX} label="Ban Manager" />
                </div>

                <div className="flex-1 overflow-y-auto pr-2 custom-scrollbar pb-6">
                    {activeTab === 'overview' && (
                        <div className="flex flex-col gap-6">
                            {/* Selected Player Controls */}
                            <div className="bg-surface border border-border rounded-lg p-6 shadow-sm">
                                <div className="flex items-center justify-between mb-6">
                                    <h3 className="text-lg font-medium text-text flex items-center gap-2">
                                        <UserX size={20} className="text-text-muted" />
                                        {selectedPlayer ? (
                                            <span>Managing: <span className="text-primary font-bold">{selectedPlayer}</span></span>
                                        ) : (
                                            <span className="text-text-muted italic">Select a player to manage</span>
                                        )}
                                    </h3>
                                </div>

                                {selectedPlayer ? (
                                    <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                                        <ActionButton
                                            icon={MessageSquare} label="Message" color="text-blue-400" bg="bg-blue-400/10" border="border-blue-400/20"
                                            onClick={() => handlePlayerAction('Message', window.electronAPI.messagePlayer, true, 'Message:')}
                                        />
                                        <ActionButton
                                            icon={Ban} label="Kick" color="text-orange-400" bg="bg-orange-400/10" border="border-orange-400/20"
                                            onClick={() => handlePlayerAction('Kick', window.electronAPI.kickPlayer, true, 'Reason (Optional):')}
                                        />
                                        <ActionButton
                                            icon={UserX} label="Ban" color="text-error" bg="bg-error/10" border="border-error/20"
                                            onClick={() => handlePlayerAction('Ban', window.electronAPI.banPlayer, true, 'Reason (Optional):')}
                                        />
                                        <ActionButton
                                            icon={MapPin} label="Teleport To" color="text-purple-400" bg="bg-purple-400/10" border="border-purple-400/20"
                                            onClick={handleTeleport}
                                        />
                                        <ActionButton
                                            icon={Shield} label="Make Admin" color="text-yellow-400" bg="bg-yellow-400/10" border="border-yellow-400/20"
                                            onClick={() => handleAction('Grant Admin', () => window.electronAPI.setAccessLevel(selectedPlayer, 'admin'), `Make ${selectedPlayer} an admin?`)}
                                        />
                                        <div className="flex gap-2">
                                            <button
                                                onClick={() => handleAction('Godmode On', () => window.electronAPI.godMode(selectedPlayer, true))}
                                                className="flex-1 flex flex-col items-center justify-center gap-2 p-3 rounded-md bg-surface-hover hover:bg-border border border-border transition-all"
                                            >
                                                <Eye size={18} className="text-text-muted" />
                                                <span className="text-xs font-medium text-text-muted">God On</span>
                                            </button>
                                            <button
                                                onClick={() => handleAction('Godmode Off', () => window.electronAPI.godMode(selectedPlayer, false))}
                                                className="flex-1 flex flex-col items-center justify-center gap-2 p-3 rounded-md bg-surface-hover hover:bg-border border border-border transition-all"
                                            >
                                                <EyeOff size={18} className="text-text-muted" />
                                                <span className="text-xs font-medium text-text-muted">God Off</span>
                                            </button>
                                        </div>
                                    </div>
                                ) : (
                                    <div className="h-32 flex items-center justify-center border-2 border-dashed border-border rounded-md bg-surface-hover/30 text-text-muted text-sm">
                                        No player selected
                                    </div>
                                )}
                            </div>

                            {/* World & Server Controls */}
                            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                                {/* World Events */}
                                <div className="bg-surface border border-border rounded-lg p-6 shadow-sm">
                                    <h3 className="text-sm font-medium text-text uppercase tracking-wider mb-4 flex items-center gap-2">
                                        <Zap size={16} className="text-yellow-500" />
                                        World Events
                                    </h3>
                                    <div className="grid grid-cols-2 gap-3">
                                        <ActionButton
                                            icon={Crosshair} label="Gunshot Event"
                                            onClick={() => handleAction('Gunshot Event', window.electronAPI.doGunshot)}
                                        />
                                        <ActionButton
                                            icon={Radio} label="Chopper Event"
                                            onClick={() => handleAction('Chopper Event', window.electronAPI.doChopper)}
                                        />
                                        <ActionButton
                                            icon={CloudRain} label="Start Rain"
                                            onClick={() => handleAction('Start Rain', () => window.electronAPI.startRain(100))}
                                        />
                                        <ActionButton
                                            icon={Sun} label="Stop Rain"
                                            onClick={() => handleAction('Stop Rain', window.electronAPI.stopRain)}
                                        />
                                    </div>
                                </div>

                                {/* Server Broadcast */}
                                <div className="bg-surface border border-border rounded-lg p-6 shadow-sm flex flex-col">
                                    <h3 className="text-sm font-medium text-text uppercase tracking-wider mb-4 flex items-center gap-2">
                                        <Radio size={16} className="text-blue-500" />
                                        Server Broadcast
                                    </h3>
                                    <div className="flex-1 flex flex-col gap-3">
                                        <textarea
                                            value={broadcastMsg}
                                            onChange={(e) => setBroadcastMsg(e.target.value)}
                                            placeholder="Type message to broadcast to all players..."
                                            className="flex-1 w-full bg-background border border-border rounded-md p-3 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary resize-none"
                                        />
                                        <button
                                            onClick={() => {
                                                if (broadcastMsg.trim()) {
                                                    handleAction('Broadcast', () => window.electronAPI.broadcastMessage(broadcastMsg));
                                                    setBroadcastMsg('');
                                                }
                                            }}
                                            disabled={!broadcastMsg.trim()}
                                            className="w-full py-2 bg-primary hover:bg-primary-hover text-white rounded-md transition-colors text-sm font-medium disabled:opacity-50 disabled:cursor-not-allowed"
                                        >
                                            Send Broadcast
                                        </button>
                                    </div>
                                </div>
                            </div>

                            {/* Server Management */}
                            <div className="bg-surface border border-border rounded-lg p-6 shadow-sm">
                                <h3 className="text-sm font-medium text-text uppercase tracking-wider mb-4 flex items-center gap-2">
                                    <Shield size={16} className="text-error" />
                                    Danger Zone
                                </h3>
                                <div className="flex gap-4">
                                    <button
                                        onClick={() => handleAction('Save World', () => window.electronAPI.sendCommand('save'))}
                                        className="flex items-center gap-2 px-4 py-2 bg-surface hover:bg-border border border-border text-text rounded-md transition-colors text-sm font-medium"
                                    >
                                        <Save size={16} />
                                        Force Save
                                    </button>
                                    <button
                                        onClick={() => handleAction('Quit Server', () => window.electronAPI.sendCommand('quit'), "Are you sure you want to shutdown the server?")}
                                        className="flex items-center gap-2 px-4 py-2 bg-error/10 hover:bg-error/20 border border-error/20 text-error rounded-md transition-colors text-sm font-medium"
                                    >
                                        <LogOut size={16} />
                                        Shutdown Server
                                    </button>
                                </div>
                            </div>
                        </div>
                    )}

                    {activeTab === 'skills' && (
                        <SkillManager
                            selectedPlayer={selectedPlayer}
                            actionLoading={actionLoading}
                            setActionLoading={setActionLoading}
                        />
                    )}

                    {activeTab === 'items' && (
                        <ItemSpawner
                            selectedPlayer={selectedPlayer}
                            actionLoading={actionLoading}
                            setActionLoading={setActionLoading}
                        />
                    )}

                    {activeTab === 'bans' && (
                        <BanManager
                            actionLoading={actionLoading}
                            setActionLoading={setActionLoading}
                        />
                    )}
                </div>
            </div>

            {/* Confirmation Modal */}
            <ConfirmationModal
                isOpen={modal.isOpen}
                onClose={() => setModal(prev => ({ ...prev, isOpen: false }))}
                onConfirm={modal.onConfirm}
                title={modal.title}
                message={modal.message}
                confirmText={modal.confirmText}
                confirmColor={modal.confirmColor}
            />

            {/* Input Modal */}
            <AnimatePresence>
                {inputModal.isOpen && (
                    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm">
                        <motion.div
                            initial={{ opacity: 0, scale: 0.95 }}
                            animate={{ opacity: 1, scale: 1 }}
                            exit={{ opacity: 0, scale: 0.95 }}
                            className="bg-surface border border-border rounded-lg shadow-xl w-full max-w-md p-6"
                        >
                            <h3 className="text-lg font-bold text-text mb-4">{inputModal.title}</h3>
                            <div className="mb-4">
                                <label className="block text-xs text-text-muted font-medium uppercase mb-1.5">{inputModal.label}</label>
                                <input
                                    autoFocus
                                    type="text"
                                    className="w-full bg-background border border-border rounded-md px-3 py-2 text-text focus:outline-none focus:ring-1 focus:ring-primary"
                                    onKeyDown={(e) => {
                                        if (e.key === 'Enter') inputModal.onConfirm(e.target.value);
                                        if (e.key === 'Escape') setInputModal(prev => ({ ...prev, isOpen: false }));
                                    }}
                                    onChange={(e) => {
                                        // Update local value if we were using state for it, 
                                        // but here we just pass e.target.value to onConfirm
                                    }}
                                />
                            </div>
                            <div className="flex justify-end gap-3">
                                <button
                                    onClick={() => setInputModal(prev => ({ ...prev, isOpen: false }))}
                                    className="px-4 py-2 text-sm font-medium text-text-muted hover:text-text transition-colors"
                                >
                                    Cancel
                                </button>
                                <button
                                    onClick={(e) => {
                                        // We need to grab the input value. 
                                        const val = e.target.parentElement.previousElementSibling.querySelector('input').value;
                                        inputModal.onConfirm(val);
                                    }}
                                    className="px-4 py-2 text-sm font-medium bg-primary hover:bg-primary-hover text-white rounded-md transition-colors"
                                >
                                    Confirm
                                </button>
                            </div>
                        </motion.div>
                    </div>
                )}
            </AnimatePresence>
        </div>
    );
};

const ActionButton = ({ icon: Icon, label, onClick, color = "text-text", bg = "bg-surface-hover", border = "border-border" }) => (
    <button
        onClick={onClick}
        className={clsx(
            "flex flex-col items-center justify-center gap-2 p-4 rounded-md border transition-all hover:scale-[1.02] active:scale-[0.98]",
            bg, border, "hover:brightness-110"
        )}
    >
        <Icon size={24} className={color} />
        <span className={clsx("text-xs font-medium", color)}>{label}</span>
    </button>
);

const TabButton = ({ active, onClick, icon: Icon, label }) => (
    <button
        onClick={onClick}
        className={clsx(
            "flex items-center gap-2 px-4 py-3 text-sm font-medium border-b-2 transition-colors",
            active ? "border-primary text-primary" : "border-transparent text-text-muted hover:text-text hover:bg-surface-hover"
        )}
    >
        <Icon size={16} />
        {label}
    </button>
);

export default Admin;
