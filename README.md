# KnoxHost

![KnoxHost Logo](assets/logo.png)

**KnoxHost** is a modern, server management tool for *Project Zomboid*. Built with Electron and React, it provides a streamlined interface for deploying, configuring, and managing your dedicated servers.

## Features

-   **🚀 One-Click Deployment**: Install and update the dedicated server via SteamCMD automatically.
-   **⚙️ Advanced Configuration**: Visual editor for Sandbox settings, Spawn Regions, and Zombie Lore.
-   **📦 Mod Manager**: Browse, search, and install Steam Workshop mods directly from the app.
-   **🛡️ Whitelist Management**: Manage user access with an integrated SQLite-backed whitelist interface.
-   **🔄 Automated Tasks**: Schedule automatic backups and server restarts.
-   **🖥️ RCON Console**: Send commands directly to your server instance.
-   **🎨 Modern UI**: Tactical, dark-mode interface with interactive backgrounds and smooth animations.




![Feature Showcase](assets/features.png)

-   **Electron Main**: Handles system operations, file I/O, and SteamCMD execution.
-   **React Renderer**: Provides the responsive user interface.
-   **IPC Bridge**: Secure communication layer between frontend and backend.
-   **SQLite**: Local database for managing server whitelists.

## Getting Started

### Prerequisites

-   Windows 10/11
-   Node.js (v16+)
-   Steam Account, no login in KnoxHost required (for Workshop content and SteamCMD)

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/yourusername/KnoxHost.git
    ```
2.  Install dependencies:
    ```bash
    npm install
    ```
3.  Start the development server:
    ```bash
    npm run dev
    ```

## Building for Production

To create a standalone executable:

```bash
npm run build
```

## License

MIT License - see [LICENSE](LICENSE) for details.
