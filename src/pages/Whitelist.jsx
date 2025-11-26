import React, { useState, useEffect } from 'react';
import { Users, UserPlus, Trash2, Shield, ShieldAlert, RefreshCw, Search } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';

const Whitelist = () => {
    const [users, setUsers] = useState([]);
    const [serverName, setServerName] = useState(() => localStorage.getItem('lastSelectedConfig') || 'servertest');
    const [loading, setLoading] = useState(false);
    const [searchQuery, setSearchQuery] = useState('');
    const [showAddModal, setShowAddModal] = useState(false);

    // Add User Form State
    const [newUsername, setNewUsername] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [newIsAdmin, setNewIsAdmin] = useState(false);

    useEffect(() => {
        loadWhitelist();
    }, [serverName]);

    const loadWhitelist = async () => {
        if (!window.electronAPI) return;
        setLoading(true);
        const list = await window.electronAPI.getWhitelist(serverName);
        setUsers(list || []);
        setLoading(false);
    };

    const handleAddUser = async (e) => {
        e.preventDefault();
        if (!window.electronAPI) return;

        const result = await window.electronAPI.addToWhitelist(serverName, newUsername, newPassword, newIsAdmin);
        if (result.success) {
            loadWhitelist();
            setShowAddModal(false);
            setNewUsername('');
            setNewPassword('');
            setNewIsAdmin(false);
        } else {
            alert(`Failed to add user: ${result.error}`);
        }
    };

    const handleRemoveUser = async (username) => {
        if (!confirm(`Remove ${username} from whitelist?`)) return;
        if (!window.electronAPI) return;

        const result = await window.electronAPI.removeFromWhitelist(serverName, username);
        if (result.success) {
            loadWhitelist();
        } else {
            alert(`Failed to remove user: ${result.error}`);
        }
    };

    const filteredUsers = users.filter(u => u.username.toLowerCase().includes(searchQuery.toLowerCase()));

    return (
        <div className="space-y-6 h-full flex flex-col">
            {/* Header */}
            <div className="flex items-center justify-between shrink-0">
                <div>
                    <h1 className="text-2xl font-bold text-text tracking-tight flex items-center gap-3">
                        <Users className="text-primary" size={28} />
                        Whitelist Management
                    </h1>
                    <p className="text-text-muted text-sm mt-1">Manage allowed users for {serverName}</p>
                </div>
                <div className="flex gap-3">
                    <button
                        onClick={loadWhitelist}
                        className="p-2 text-text-muted hover:text-text bg-surface border border-border rounded-md hover:border-primary/50 transition-all"
                        title="Refresh List"
                    >
                        <RefreshCw size={20} className={loading ? "animate-spin" : ""} />
                    </button>
                    <button
                        onClick={() => setShowAddModal(true)}
                        className="flex items-center gap-2 px-4 py-2 bg-primary/10 hover:bg-primary/20 border border-primary/20 hover:border-primary text-primary rounded-md transition-all shadow-sm hover:shadow-primary/20"
                    >
                        <UserPlus size={18} />
                        <span className="font-medium">Add User</span>
                    </button>
                </div>
            </div>

            {/* Search & List */}
            <div className="flex-1 bg-surface border border-border rounded-lg overflow-hidden flex flex-col shadow-sm">
                <div className="p-4 border-b border-border bg-surface-hover/50">
                    <div className="relative max-w-md">
                        <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-text-muted" size={16} />
                        <input
                            type="text"
                            placeholder="Search users..."
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            className="w-full bg-background border border-border rounded-md pl-9 pr-4 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary transition-shadow"
                        />
                    </div>
                </div>

                <div className="flex-1 overflow-y-auto p-2">
                    {loading ? (
                        <div className="flex flex-col items-center justify-center h-full text-text-muted gap-2">
                            <RefreshCw className="animate-spin" size={24} />
                            <span className="text-sm">Loading whitelist...</span>
                        </div>
                    ) : filteredUsers.length === 0 ? (
                        <div className="flex flex-col items-center justify-center h-full text-text-muted gap-2 opacity-50">
                            <Users size={48} />
                            <span className="text-sm">No users found in whitelist.</span>
                        </div>
                    ) : (
                        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-2">
                            <AnimatePresence>
                                {filteredUsers.map((user) => (
                                    <motion.div
                                        key={user.username}
                                        initial={{ opacity: 0, scale: 0.95 }}
                                        animate={{ opacity: 1, scale: 1 }}
                                        exit={{ opacity: 0, scale: 0.95 }}
                                        className="bg-background border border-border rounded-md p-3 flex items-center justify-between group hover:border-primary/30 transition-colors"
                                    >
                                        <div className="flex items-center gap-3">
                                            <div className={clsx("w-8 h-8 rounded-full flex items-center justify-center", user.admin ? "bg-primary/20 text-primary" : "bg-surface-hover text-text-muted")}>
                                                {user.admin ? <Shield size={16} /> : <Users size={16} />}
                                            </div>
                                            <div>
                                                <div className="font-medium text-text text-sm">{user.username}</div>
                                                <div className="text-xs text-text-muted font-mono">
                                                    {user.admin ? 'Admin' : 'User'}
                                                </div>
                                            </div>
                                        </div>
                                        <button
                                            onClick={() => handleRemoveUser(user.username)}
                                            className="p-1.5 text-text-muted hover:text-error hover:bg-error/10 rounded-md opacity-0 group-hover:opacity-100 transition-all"
                                            title="Remove User"
                                        >
                                            <Trash2 size={16} />
                                        </button>
                                    </motion.div>
                                ))}
                            </AnimatePresence>
                        </div>
                    )}
                </div>
            </div>

            {/* Add User Modal */}
            <AnimatePresence>
                {showAddModal && (
                    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm">
                        <motion.div
                            initial={{ opacity: 0, scale: 0.95, y: 20 }}
                            animate={{ opacity: 1, scale: 1, y: 0 }}
                            exit={{ opacity: 0, scale: 0.95, y: 20 }}
                            className="bg-surface border border-border rounded-lg shadow-xl w-full max-w-md overflow-hidden"
                        >
                            <div className="p-4 border-b border-border flex justify-between items-center bg-surface-hover/50">
                                <h3 className="font-medium text-text">Add User to Whitelist</h3>
                                <button onClick={() => setShowAddModal(false)} className="text-text-muted hover:text-text">✕</button>
                            </div>
                            <form onSubmit={handleAddUser} className="p-6 space-y-4">
                                <div className="space-y-1.5">
                                    <label className="text-xs font-medium text-text-muted">Username</label>
                                    <input
                                        type="text"
                                        required
                                        value={newUsername}
                                        onChange={e => setNewUsername(e.target.value)}
                                        className="w-full bg-background border border-border rounded-md px-3 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary"
                                    />
                                </div>
                                <div className="space-y-1.5">
                                    <label className="text-xs font-medium text-text-muted">Password</label>
                                    <input
                                        type="text"
                                        required
                                        value={newPassword}
                                        onChange={e => setNewPassword(e.target.value)}
                                        className="w-full bg-background border border-border rounded-md px-3 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary"
                                    />
                                </div>
                                <div className="flex items-center gap-2 pt-2">
                                    <input
                                        type="checkbox"
                                        id="isAdmin"
                                        checked={newIsAdmin}
                                        onChange={e => setNewIsAdmin(e.target.checked)}
                                        className="w-4 h-4 rounded border-border bg-background text-primary focus:ring-primary"
                                    />
                                    <label htmlFor="isAdmin" className="text-sm text-text cursor-pointer select-none">Grant Admin Privileges</label>
                                </div>
                                <div className="pt-4 flex gap-3">
                                    <button
                                        type="button"
                                        onClick={() => setShowAddModal(false)}
                                        className="flex-1 px-4 py-2 border border-border rounded-md text-text-muted hover:text-text hover:bg-surface-hover transition-colors"
                                    >
                                        Cancel
                                    </button>
                                    <button
                                        type="submit"
                                        className="flex-1 px-4 py-2 bg-primary hover:bg-primary-hover text-white rounded-md transition-colors font-medium"
                                    >
                                        Add User
                                    </button>
                                </div>
                            </form>
                        </motion.div>
                    </div>
                )}
            </AnimatePresence>
        </div>
    );
};

// Helper for clsx if not imported
function clsx(...classes) {
    return classes.filter(Boolean).join(' ');
}

export default Whitelist;
