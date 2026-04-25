# Pi-hole Deployment (Alpine)
Provisions an Alpine Linux LXC container and installs Pi-hole v6.

## Features
- **Resources**: 512MB RAM, 1 Core (Ultra-lightweight).
- **Alpine Support**: Handles specific Alpine dependencies (`iproute2`, `libcap`, etc.) and uses the unattended installer.
- **Config**: Deploys a pre-defined `pihole.toml` configuration.

## Roles Used
- `lxc-alpine`: Base container creation.
