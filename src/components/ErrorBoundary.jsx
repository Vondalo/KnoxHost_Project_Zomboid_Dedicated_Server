import React from 'react';
import { AlertTriangle, RefreshCw, Home } from 'lucide-react';

class ErrorBoundary extends React.Component {
    constructor(props) {
        super(props);
        this.state = { hasError: false, error: null, errorInfo: null };
    }

    static getDerivedStateFromError(error) {
        return { hasError: true, error };
    }

    componentDidCatch(error, errorInfo) {
        console.error("Uncaught error:", error, errorInfo);
        this.setState({ errorInfo });
    }

    handleReload = () => {
        window.location.reload();
    };

    handleGoHome = () => {
        window.location.href = '/';
    };

    render() {
        if (this.state.hasError) {
            return (
                <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-background/95 backdrop-blur-md p-6 cursor-auto" style={{ cursor: 'auto' }}>
                    <div className="max-w-lg w-full bg-surface border border-error/30 rounded-lg shadow-2xl overflow-hidden relative">
                        {/* Tactical Header */}
                        <div className="bg-error/10 border-b border-error/20 p-4 flex items-center gap-3">
                            <AlertTriangle className="text-error animate-pulse" size={24} />
                            <h2 className="text-lg font-bold text-error tracking-wide uppercase">System Critical Failure</h2>
                        </div>

                        <div className="p-6 space-y-6">
                            <div className="space-y-2">
                                <p className="text-text font-medium">An unrecoverable error has occurred.</p>
                                <p className="text-text-muted text-sm">The application encountered an unexpected state and cannot continue.</p>
                            </div>

                            {/* Error Details */}
                            <div className="bg-black/40 border border-border rounded p-4 font-mono text-xs text-error/80 overflow-auto max-h-48 custom-scrollbar">
                                <p className="font-bold mb-2">{this.state.error && this.state.error.toString()}</p>
                                <pre className="whitespace-pre-wrap opacity-70">
                                    {this.state.errorInfo && this.state.errorInfo.componentStack}
                                </pre>
                            </div>

                            {/* Actions */}
                            <div className="flex gap-3 pt-2">
                                <button
                                    onClick={this.handleReload}
                                    className="flex-1 flex items-center justify-center gap-2 px-4 py-2 bg-primary hover:bg-primary-hover text-white rounded-md transition-colors font-medium shadow-lg shadow-primary/20"
                                >
                                    <RefreshCw size={16} />
                                    Reinitialize System
                                </button>
                                <button
                                    onClick={this.handleGoHome}
                                    className="flex items-center justify-center gap-2 px-4 py-2 bg-surface hover:bg-surface-hover border border-border text-text rounded-md transition-colors font-medium"
                                >
                                    <Home size={16} />
                                    Dashboard
                                </button>
                            </div>
                        </div>

                        {/* Decorative Corner Accents */}
                        <div className="absolute top-0 left-0 w-2 h-2 border-t-2 border-l-2 border-error/50" />
                        <div className="absolute top-0 right-0 w-2 h-2 border-t-2 border-r-2 border-error/50" />
                        <div className="absolute bottom-0 left-0 w-2 h-2 border-b-2 border-l-2 border-error/50" />
                        <div className="absolute bottom-0 right-0 w-2 h-2 border-b-2 border-r-2 border-error/50" />
                    </div>
                </div>
            );
        }

        return this.props.children;
    }
}

export default ErrorBoundary;
