import React, { useState } from 'react';
import { Gift, Truck, Search } from 'lucide-react';
import { items } from '../../data/items';
import { vehicles } from '../../data/vehicles';
import { useToast } from '../../context/ToastContext';

const ItemSpawner = ({ selectedPlayer, actionLoading, setActionLoading }) => {
    const [itemSearch, setItemSearch] = useState('');
    const [vehicleSearch, setVehicleSearch] = useState('');
    const [selectedItem, setSelectedItem] = useState('');
    const [selectedVehicle, setSelectedVehicle] = useState('');
    const [amount, setAmount] = useState(1);
    const toast = useToast();

    const handleGiveItem = async () => {
        if (!selectedPlayer || !selectedItem) return;
        setActionLoading(true);
        try {
            await window.electronAPI.giveItem(selectedPlayer, selectedItem, amount);
            toast.success(`Gave ${amount}x ${selectedItem} to ${selectedPlayer}`);
        } catch (err) {
            console.error(err);
            toast.error("Failed to give item");
        } finally {
            setActionLoading(false);
        }
    };

    const handleSpawnVehicle = async () => {
        if (!selectedPlayer || !selectedVehicle) return;
        setActionLoading(true);
        try {
            await window.electronAPI.addVehicle(selectedPlayer, selectedVehicle);
            toast.success(`Spawned ${selectedVehicle} for ${selectedPlayer}`);
        } catch (err) {
            console.error(err);
            toast.error("Failed to spawn vehicle");
        } finally {
            setActionLoading(false);
        }
    };

    if (!selectedPlayer) return <div className="text-text-muted italic">Select a player to spawn items/vehicles.</div>;

    // Filter items
    const filteredItems = items.filter(i =>
        i.label.toLowerCase().includes(itemSearch.toLowerCase()) ||
        i.value.toLowerCase().includes(itemSearch.toLowerCase())
    );

    // Filter vehicles
    const filteredVehicles = vehicles.filter(v =>
        v.label.toLowerCase().includes(vehicleSearch.toLowerCase()) ||
        v.value.toLowerCase().includes(vehicleSearch.toLowerCase())
    );

    return (
        <div className="space-y-6">
            {/* Item Spawner */}
            <div className="bg-surface border border-border rounded-lg p-6">
                <h3 className="text-lg font-medium text-text mb-4 flex items-center gap-2">
                    <Gift size={20} className="text-green-400" />
                    Item Spawner
                </h3>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div className="md:col-span-2">
                        <label className="block text-xs text-text-muted font-medium uppercase mb-1.5">Search & Select Item</label>
                        <div className="relative">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-text-muted" size={14} />
                            <select
                                className="w-full bg-background border border-border rounded-md pl-9 pr-3 py-2 text-text focus:outline-none focus:ring-1 focus:ring-primary appearance-none"
                                value={selectedItem}
                                onChange={(e) => setSelectedItem(e.target.value)}
                            >
                                <option value="">Select an item...</option>
                                {filteredItems.map((item, i) => (
                                    <option key={i} value={item.value} disabled={!item.value} className={!item.value ? "font-bold text-text-muted bg-surface-hover" : ""}>
                                        {item.label}
                                    </option>
                                ))}
                            </select>
                        </div>
                        <input
                            type="text"
                            placeholder="Filter items..."
                            className="mt-2 w-full bg-background border border-border rounded-md px-3 py-1.5 text-xs text-text focus:outline-none focus:ring-1 focus:ring-primary"
                            value={itemSearch}
                            onChange={(e) => setItemSearch(e.target.value)}
                        />
                    </div>
                    <div>
                        <label className="block text-xs text-text-muted font-medium uppercase mb-1.5">Amount</label>
                        <input
                            type="number"
                            min="1"
                            className="w-full bg-background border border-border rounded-md px-3 py-2 text-text focus:outline-none focus:ring-1 focus:ring-primary"
                            value={amount}
                            onChange={(e) => setAmount(Number(e.target.value))}
                        />
                    </div>
                </div>
                <div className="mt-4 flex justify-end">
                    <button
                        onClick={handleGiveItem}
                        disabled={!selectedItem || actionLoading}
                        className="flex items-center gap-2 px-4 py-2 bg-primary hover:bg-primary-hover text-white rounded-md transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                        <Gift size={16} />
                        Give Item
                    </button>
                </div>
            </div>

            {/* Vehicle Spawner */}
            <div className="bg-surface border border-border rounded-lg p-6">
                <h3 className="text-lg font-medium text-text mb-4 flex items-center gap-2">
                    <Truck size={20} className="text-teal-400" />
                    Vehicle Spawner
                </h3>
                <div className="grid grid-cols-1 gap-4">
                    <div>
                        <label className="block text-xs text-text-muted font-medium uppercase mb-1.5">Search & Select Vehicle</label>
                        <div className="relative">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-text-muted" size={14} />
                            <select
                                className="w-full bg-background border border-border rounded-md pl-9 pr-3 py-2 text-text focus:outline-none focus:ring-1 focus:ring-primary appearance-none"
                                value={selectedVehicle}
                                onChange={(e) => setSelectedVehicle(e.target.value)}
                            >
                                <option value="">Select a vehicle...</option>
                                {filteredVehicles.map((v, i) => (
                                    <option key={i} value={v.value} disabled={!v.value} className={!v.value ? "font-bold text-text-muted bg-surface-hover" : ""}>
                                        {v.label}
                                    </option>
                                ))}
                            </select>
                        </div>
                        <input
                            type="text"
                            placeholder="Filter vehicles..."
                            className="mt-2 w-full bg-background border border-border rounded-md px-3 py-1.5 text-xs text-text focus:outline-none focus:ring-1 focus:ring-primary"
                            value={vehicleSearch}
                            onChange={(e) => setVehicleSearch(e.target.value)}
                        />
                    </div>
                </div>
                <div className="mt-4 flex justify-end">
                    <button
                        onClick={handleSpawnVehicle}
                        disabled={!selectedVehicle || actionLoading}
                        className="flex items-center gap-2 px-4 py-2 bg-primary hover:bg-primary-hover text-white rounded-md transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                        <Truck size={16} />
                        Spawn Vehicle
                    </button>
                </div>
            </div>
        </div>
    );
};

export default ItemSpawner;
