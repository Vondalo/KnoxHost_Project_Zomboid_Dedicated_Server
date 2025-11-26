import React, { useEffect, useState } from 'react';
import { motion, useMotionValue, useSpring } from 'framer-motion';

const CustomCursor = () => {
    const [isHovering, setIsHovering] = useState(false);
    const [isClicking, setIsClicking] = useState(false);

    // Mouse position
    const mouseX = useMotionValue(0);
    const mouseY = useMotionValue(0);

    // Smooth spring for the main reticle
    const springConfig = { damping: 20, stiffness: 300, mass: 0.2 };
    const cursorX = useSpring(mouseX, springConfig);
    const cursorY = useSpring(mouseY, springConfig);

    useEffect(() => {
        const moveCursor = (e) => {
            mouseX.set(e.clientX);
            mouseY.set(e.clientY);
        };

        const handleMouseDown = () => setIsClicking(true);
        const handleMouseUp = () => setIsClicking(false);

        const handleMouseOver = (e) => {
            if (e.target.tagName === 'BUTTON' || e.target.tagName === 'A' || e.target.closest('button') || e.target.closest('a') || e.target.closest('.cursor-pointer')) {
                setIsHovering(true);
            } else {
                setIsHovering(false);
            }
        };

        window.addEventListener('mousemove', moveCursor);
        window.addEventListener('mousedown', handleMouseDown);
        window.addEventListener('mouseup', handleMouseUp);
        window.addEventListener('mouseover', handleMouseOver);

        return () => {
            window.removeEventListener('mousemove', moveCursor);
            window.removeEventListener('mousedown', handleMouseDown);
            window.removeEventListener('mouseup', handleMouseUp);
            window.removeEventListener('mouseover', handleMouseOver);
        };
    }, [mouseX, mouseY]);

    return (
        <div className="pointer-events-none fixed inset-0 z-[9999] overflow-hidden">
            {/* Tactical Reticle */}
            <motion.div
                className="absolute"
                style={{
                    x: cursorX,
                    y: cursorY,
                    translateX: '-50%',
                    translateY: '-50%'
                }}
            >
                {/* Center Dot */}
                <motion.div
                    className="w-1 h-1 bg-primary rounded-full absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 shadow-[0_0_10px_#f43f5e]"
                    animate={{ scale: isClicking ? 0.5 : 1 }}
                />

                {/* Rotating Brackets - Smaller (w-5 h-5) */}
                <motion.div
                    className="w-5 h-5 border border-primary/30 rounded-sm absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2"
                    animate={{
                        rotate: isHovering ? 45 : 0,
                        scale: isHovering ? 1.2 : 1,
                        borderColor: isClicking ? '#f43f5e' : 'rgba(244, 63, 94, 0.3)'
                    }}
                    transition={{ type: "spring", stiffness: 200, damping: 20 }}
                >
                    {/* Corner accents */}
                    <div className="absolute -top-0.5 -left-0.5 w-1.5 h-1.5 border-t border-l border-primary" />
                    <div className="absolute -top-0.5 -right-0.5 w-1.5 h-1.5 border-t border-r border-primary" />
                    <div className="absolute -bottom-0.5 -left-0.5 w-1.5 h-1.5 border-b border-l border-primary" />
                    <div className="absolute -bottom-0.5 -right-0.5 w-1.5 h-1.5 border-b border-r border-primary" />
                </motion.div>

                {/* Crosshair Lines - Smaller (w-8 h-8) */}
                <motion.div
                    className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-8 h-8"
                    animate={{ rotate: isHovering ? -45 : 0 }}
                >
                    <div className="absolute top-1/2 left-0 w-full h-[1px] bg-primary/20 -translate-y-1/2" />
                    <div className="absolute left-1/2 top-0 h-full w-[1px] bg-primary/20 -translate-x-1/2" />
                </motion.div>
            </motion.div>
        </div>
    );
};

export default CustomCursor;
