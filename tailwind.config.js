/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        background: '#09090b', // Zinc 950
        surface: '#18181b',    // Zinc 900
        'surface-hover': '#27272a', // Zinc 800
        border: '#27272a',     // Zinc 800
        primary: '#f43f5e',    // Rose 500
        'primary-hover': '#e11d48', // Rose 600
        text: {
          DEFAULT: '#fafafa',  // Zinc 50
          muted: '#a1a1aa',    // Zinc 400
          dim: '#52525b',      // Zinc 600
        },
        success: '#10b981',    // Emerald 500
        warning: '#f59e0b',    // Amber 500
        error: '#ef4444',      // Red 500
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
        mono: ['JetBrains Mono', 'monospace'],
      },
      backgroundImage: {
        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
      },
      boxShadow: {
        'glow': '0 0 20px -5px rgba(244, 63, 94, 0.3)',
      }
    },
  },
  plugins: [],
}
