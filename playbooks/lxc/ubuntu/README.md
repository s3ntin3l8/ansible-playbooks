# Ubuntu LXC Node
Provisions a standard Ubuntu LTS LXC container on Proxmox.

## Features
- **Resources**: 2 Cores, 2GB RAM, 10GB Disk (default).
- **Stack**: Includes Tailscale integration, primary user keys, and automated monitoring.
- **Observability**: Automatically joins the Grafana Loki/Prometheus stack via Alloy.

## Roles Used
- `lxc-ubuntu`: Base container creation.
- `common`: Base system configuration.
- `beszel-agent`: Hardware resource monitoring.
- `grafana-alloy`: Integrated logging and metrics.
