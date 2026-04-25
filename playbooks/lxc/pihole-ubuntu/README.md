# Pi-hole Deployment (Ubuntu)
Provisions an Ubuntu-based LXC container and installs Pi-hole v6.

## Features
- **Resources**: 1GB RAM, 2 Cores, 10GB Disk.
- **Pi-hole v6**: Installs the latest Pi-hole version using the dedicated role.
- **OS**: Optimized for Ubuntu LTS.

## Roles Used
- `lxc-ubuntu`: Base container creation.
- `pihole`: Pi-hole v6 installation and configuration.
