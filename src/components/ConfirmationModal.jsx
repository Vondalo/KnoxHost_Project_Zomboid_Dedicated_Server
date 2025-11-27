import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { AlertTriangle, X } from 'lucide-react';

const ConfirmationModal = ({ isOpen, onClose, onConfirm, title, message, confirmText = "Confirm", confirmColor = "bg-primary" }) => {
    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 z-[60] flex items-center justify-center bg-black/60 backdrop-blur-sm p-4">
            <motion.div
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
                exit={{ opacity: 0, scale: 0.95 }}
                className="bg-surface border border-border rounded-lg shadow-2xl max-w-md w-full overflow-hidden"
            >
                <div className="p-4 border-b border-border flex justify-between items-center bg-surface-hover/50">
                    <h3 className="font-bold text-text flex items-center gap-2">
                        <AlertTriangle size={20} className="text-yellow-500" />
                        {title}
                    </h3>
                    <button onClick={onClose} className="text-text-muted hover:text-text transition-colors">
                        <X size={20} />
                    </button>
                </div>
                <div className="p-6">
                    <p className="text-text-muted">{message}</p>
                </div>
                <div className="p-4 border-t border-border bg-background flex justify-end gap-3">
                    <button
                        onClick={onClose}
                        className="px-4 py-2 rounded-md border border-border text-text hover:bg-surface-hover transition-colors"
                    >
                        Cancel
                    </button>
                    <button
                        onClick={() => {
                            onConfirm();
                            onClose();
                        }}
                        className={`px-4 py-2 rounded-md text-white ${confirmColor} hover:opacity-90 transition-opacity`}
                    >
                        {confirmText}
                    </button>
                </div>
            </motion.div>
        </div>
    );
};

export default ConfirmationModal;
