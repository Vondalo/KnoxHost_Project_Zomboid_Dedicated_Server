import React, { useState } from 'react';
import { Zap, ChevronRight } from 'lucide-react';
import { skills } from '../../data/skills';
import { useToast } from '../../context/ToastContext';

const SkillManager = ({ selectedPlayer, actionLoading, setActionLoading }) => {
    const [selectedSkill, setSelectedSkill] = useState('');
    const [xpAmount, setXpAmount] = useState(100);
    const toast = useToast();

    const handleAddXp = async () => {
        if (!selectedPlayer || !selectedSkill) return;
        setActionLoading(true);
        try {
            await window.electronAPI.addXp(selectedPlayer, selectedSkill, xpAmount);
            toast.success(`Added ${xpAmount} XP to ${selectedSkill} for ${selectedPlayer}`);
        } catch (err) {
            console.error(err);
            toast.error("Failed to add XP");
        } finally {
            setActionLoading(false);
        }
    };

    if (!selectedPlayer) return <div className="text-text-muted italic">Select a player to manage skills.</div>;

    return (
        <div className="space-y-6">
            <div className="bg-surface border border-border rounded-lg p-6">
                <h3 className="text-lg font-medium text-text mb-4 flex items-center gap-2">
                    <Zap size={20} className="text-yellow-400" />
                    Skill & XP Manager
                </h3>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label className="block text-xs text-text-muted font-medium uppercase mb-1.5">Skill</label>
                        <select
                            className="w-full bg-background border border-border rounded-md px-3 py-2 text-text focus:outline-none focus:ring-1 focus:ring-primary"
                            value={selectedSkill}
                            onChange={(e) => setSelectedSkill(e.target.value)}
                        >
                            <option value="">Select a skill...</option>
                            {skills.map((s, i) => (
                                <option key={i} value={s.value} disabled={!s.value} className={!s.value ? "font-bold text-text-muted bg-surface-hover" : ""}>
                                    {s.label}
                                </option>
                            ))}
                        </select>
                    </div>
                    <div>
                        <label className="block text-xs text-text-muted font-medium uppercase mb-1.5">XP Amount</label>
                        <input
                            type="number"
                            className="w-full bg-background border border-border rounded-md px-3 py-2 text-text focus:outline-none focus:ring-1 focus:ring-primary"
                            value={xpAmount}
                            onChange={(e) => setXpAmount(Number(e.target.value))}
                        />
                    </div>
                </div>

                <div className="mt-4 flex justify-end">
                    <button
                        onClick={handleAddXp}
                        disabled={!selectedSkill || actionLoading}
                        className="flex items-center gap-2 px-4 py-2 bg-primary hover:bg-primary-hover text-white rounded-md transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                        <Zap size={16} />
                        Add XP
                    </button>
                </div>
            </div>
        </div>
    );
};

export default SkillManager;
