import React from 'react';
import { AlertTriangle, RefreshCw } from 'lucide-react';

class ErrorBoundary extends React.Component {
    constructor(props) {
        super(props);
        this.state = { hasError: false, error: null, errorInfo: null };
    }

    static getDerivedStateFromError(error) {
        return { hasError: true };
    }

    componentDidCatch(error, errorInfo) {
        console.error("Uncaught error:", error, errorInfo);
        this.setState({ error, errorInfo });
    }

    handleReload = () => {
        window.location.reload();
    };

    render() {
        if (this.state.hasError) {
            return (
                <div className="min-h-screen bg-background flex flex-col items-center justify-center p-6 text-center">
                    <div className="bg-surface border border-border rounded-lg p-8 max-w-md w-full shadow-2xl">
                        <div className="flex justify-center mb-6">
                            <div className="p-4 bg-error/10 rounded-full">
                                <AlertTriangle size={48} className="text-error" />
                            </div>
                        </div>
                        <h1 className="text-2xl font-bold text-text mb-2">Something went wrong</h1>
                        <p className="text-text-muted mb-6">
                            The application encountered an unexpected error.
                        </p>

                        {this.state.error && (
                            <div className="bg-black/30 rounded p-4 mb-6 text-left overflow-auto max-h-40 custom-scrollbar">
                                <code className="text-xs text-error font-mono break-all">
                                    {this.state.error.toString()}
                                </code>
                            </div>
                        )}

                        <button
                            onClick={this.handleReload}
                            className="w-full flex items-center justify-center gap-2 px-4 py-3 bg-primary hover:bg-primary-hover text-white rounded-md transition-colors font-medium"
                        >
                            <RefreshCw size={18} />
                            Reload Application
                        </button>
                    </div>
                </div>
            );
        }

        return this.props.children;
    }
}

export default ErrorBoundary;
