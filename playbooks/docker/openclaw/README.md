# OpenClaw Node
Provisions a specialized LXC container for running OpenClaw application nodes.

## Features
- **Resources**: 4 Cores, 4GB RAM, 20GB Disk (optimized for Node.js workloads).
- **Stack**: Includes Tailscale integration, primary user keys, and Homebrew for package management.
- **Customization**: Automatically displays custom ASCII art on deployment.

## Roles Used
- `lxc-ubuntu`: Base container creation.
- `common`: Base system configuration.
- `openclaw`: OpenClaw application logic.
- `homebrew`: Homebrew installation.
