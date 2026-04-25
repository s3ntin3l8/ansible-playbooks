# Traefik Gateway
Provisions and configures the central Traefik Reverse Proxy gateway for the entire infrastructure.

## Features
- **Gateway**: Serves as the primary entry point for HTTP/HTTPS traffic.
- **SSL/TLS**: Handles certificate management and TLS termination.
- **Dashboard**: Enables the Traefik dashboard for visual monitoring.
- **Integration**: Automatically syncs DNS entries with Pi-hole.

## Roles Used
- `lxc-alpine`: Base container creation (using lightweight Alpine).
- `common`: Base system configuration.
- `docker`: Docker engine installation.
- `traefik`: Core Traefik configuration (with `traefik_is_gateway: true`).
- `pihole-dns-sync`: DNS automation.
