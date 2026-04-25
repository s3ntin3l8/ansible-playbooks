# Proxmox Host Maintenance
Performs health checks and routine maintenance on the Proxmox physical host.

## Tasks
- **Updates**: Runs `apt update` and `apt dist-upgrade`.
- **Disk Monitoring**: Checks root filesystem usage and fails if it exceeds 90%.
- **Cleanup**: Removes old Proxmox ISO/LXC templates (older than 30 days).
- **Service Health**: Verifies that `pve-cluster` is running correctly.

## Usage
Run regularly (e.g., via `make maint`) to ensure host stability.
