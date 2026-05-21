import React from 'react';
import { AlertTriangle, RefreshCw, Send } from 'lucide-react';
import { recordRendererError, reportRendererError } from '../lib/errorReporting.js';

class ErrorBoundary extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            hasError: false,
            error: null,
            errorInfo: null,
            reportNote: '',
            reporting: false,
            reportStatus: null
        };
    }

    static getDerivedStateFromError(error) {
        return { hasError: true, error };
    }

    componentDidCatch(error, errorInfo) {
        console.error("Uncaught error:", error, errorInfo);
        recordRendererError('error-boundary', {
            error,
            errorInfo: {
                componentStack: errorInfo?.componentStack || null
            }
        });
        this.setState({ error, errorInfo });
    }

    handleReload = () => {
        window.location.reload();
    };

    handleNoteChange = (event) => {
        this.setState({
            reportNote: event.target.value,
            reportStatus: null
        });
    };

    handleReport = async () => {
        this.setState({ reporting: true, reportStatus: null });

        try {
            await reportRendererError('error-boundary-report', {
                error: this.state.error,
                errorInfo: {
                    componentStack: this.state.errorInfo?.componentStack || null
                },
                userNote: this.state.reportNote.trim() || null
            });

            this.setState({
                reporting: false,
                reportStatus: {
                    type: 'success',
                    message: 'Error report sent successfully.'
                }
            });
        } catch (error) {
            this.setState({
                reporting: false,
                reportStatus: {
                    type: 'error',
                    message: error.message || 'Failed to send error report.'
                }
            });
        }
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

                        {window.electronAPI?.reportError && (
                            <div className="text-left space-y-3 mb-6">
                                <label className="block text-xs font-medium uppercase tracking-wide text-text-muted">
                                    What were you doing?
                                </label>
                                <textarea
                                    value={this.state.reportNote}
                                    onChange={this.handleNoteChange}
                                    placeholder="Optional: describe what you clicked or changed before the error happened."
                                    rows={4}
                                    className="w-full bg-background border border-border rounded-md px-3 py-2 text-sm text-text focus:outline-none focus:ring-1 focus:ring-primary resize-none"
                                />

                                {this.state.reportStatus && (
                                    <div className={`text-xs rounded-md px-3 py-2 border ${this.state.reportStatus.type === 'success'
                                        ? 'bg-success/10 border-success/20 text-success'
                                        : 'bg-error/10 border-error/20 text-error'
                                        }`}>
                                        {this.state.reportStatus.message}
                                    </div>
                                )}

                                <button
                                    onClick={this.handleReport}
                                    disabled={this.state.reporting}
                                    className="w-full flex items-center justify-center gap-2 px-4 py-3 bg-surface hover:bg-surface-hover border border-border text-text rounded-md transition-colors font-medium disabled:opacity-60 disabled:cursor-not-allowed"
                                >
                                    {this.state.reporting ? <RefreshCw size={18} className="animate-spin" /> : <Send size={18} />}
                                    {this.state.reporting ? 'Sending Report...' : 'Report Error'}
                                </button>
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
