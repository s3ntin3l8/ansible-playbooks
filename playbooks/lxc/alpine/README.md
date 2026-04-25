# Alpine LXC Node
Provisions a lightweight Alpine Linux LXC container on Proxmox.

## Features
- **Resources**: 1 Core, 512MB RAM (Ultra-lightweight).
- **Stack**: Includes base configuration, automated monitoring, and bash shell.
- **Observability**: Automatically joins the Grafana Loki/Prometheus stack via Alloy.

## Roles Used
- `lxc-alpine`: Base container creation.
- `common`: Base system configuration.
- `beszel-agent`: Hardware resource monitoring.
- `grafana-alloy`: Integrated logging and metrics.
