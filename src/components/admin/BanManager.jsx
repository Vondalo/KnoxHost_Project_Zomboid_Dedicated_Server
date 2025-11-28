import React, { useState, useEffect } from 'react';
import { UserX, RefreshCw, Unlock } from 'lucide-react';
import { useToast } from '../../context/ToastContext';

const BanManager = ({ actionLoading, setActionLoading }) => {
    const [banList, setBanList] = useState([]);
    const [loading, setLoading] = useState(false);
    const toast = useToast();

    const fetchBanList = async () => {
        setLoading(true);
        try {
            const list = await window.electronAPI.getBanList();
            setBanList(list || []);
        } catch (err) {
            console.error(err);
            toast.error("Failed to fetch ban list");
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchBanList();
    }, []);

    const handleUnban = async (username) => {
        setActionLoading(true);
        try {
            await window.electronAPI.unbanUser(username);
            toast.success(`Unbanned ${username}`);
            fetchBanList(); // Refresh list
        } catch (err) {
            console.error(err);
            toast.error(`Failed to unban ${username}`);
        } finally {
            setActionLoading(false);
        }
    };

    return (
        <div className="space-y-6">
            <div className="bg-surface border border-border rounded-lg p-6">
                <div className="flex items-center justify-between mb-4">
                    <h3 className="text-lg font-medium text-text flex items-center gap-2">
                        <UserX size={20} className="text-error" />
                        Banned Players
                    </h3>
                    <button
                        onClick={fetchBanList}
                        className="p-2 hover:bg-surface-hover rounded-full text-text-muted hover:text-text transition-colors"
                        title="Refresh Ban List"
                    >
                        <RefreshCw size={16} className={loading ? "animate-spin" : ""} />
                    </button>
                </div>

                <div className="bg-background border border-border rounded-md overflow-hidden">
                    {banList.length === 0 ? (
                        <div className="p-8 text-center text-text-muted text-sm">
                            No banned players found.
                        </div>
                    ) : (
                        <div className="divide-y divide-border">
                            {banList.map((user, i) => (
                                <div key={i} className="p-3 flex items-center justify-between hover:bg-surface-hover transition-colors">
                                    <span className="text-sm text-text font-medium">{user}</span>
                                    <button
                                        onClick={() => handleUnban(user)}
                                        disabled={actionLoading}
                                        className="flex items-center gap-1.5 px-3 py-1.5 bg-surface hover:bg-success/10 text-text-muted hover:text-success border border-border hover:border-success/30 rounded text-xs transition-colors"
                                    >
                                        <Unlock size={12} />
                                        Unban
                                    </button>
                                </div>
                            ))}
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
};

export default BanManager;
