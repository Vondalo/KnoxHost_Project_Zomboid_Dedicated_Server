import React, { useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { X, CheckCircle, AlertCircle, Info, AlertTriangle } from 'lucide-react';
import clsx from 'clsx';

const Toast = ({ id, type, message, duration = 4000, onClose }) => {
    useEffect(() => {
        const timer = setTimeout(() => {
            onClose(id);
        }, duration);

        return () => clearTimeout(timer);
    }, [id, duration, onClose]);

    const icons = {
        success: <CheckCircle size={20} className="text-green-500" />,
        error: <AlertCircle size={20} className="text-red-500" />,
        info: <Info size={20} className="text-blue-500" />,
        warning: <AlertTriangle size={20} className="text-yellow-500" />
    };

    const bgColors = {
        success: 'bg-green-500/10 border-green-500/20',
        error: 'bg-red-500/10 border-red-500/20',
        info: 'bg-blue-500/10 border-blue-500/20',
        warning: 'bg-yellow-500/10 border-yellow-500/20'
    };

    return (
        <motion.div
            layout
            initial={{ opacity: 0, y: 20, scale: 0.9 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: 20, scale: 0.9 }}
            className={clsx(
                "flex items-start gap-3 p-4 rounded-lg border shadow-lg backdrop-blur-md min-w-[300px] max-w-md pointer-events-auto",
                bgColors[type] || bgColors.info,
                "bg-surface/95" // Fallback/Overlay
            )}
        >
            <div className="shrink-0 mt-0.5">{icons[type] || icons.info}</div>
            <div className="flex-1 text-sm text-text font-medium">{message}</div>
            <button
                onClick={() => onClose(id)}
                className="shrink-0 text-text-muted hover:text-text transition-colors"
            >
                <X size={16} />
            </button>
        </motion.div>
    );
};

export default Toast;
