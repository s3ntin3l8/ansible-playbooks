# Ubuntu Docker Host
Provisions an Ubuntu-based Docker host with Traefik integration and automated monitoring.

## Features
- **Resources**: 2 Cores, 4GB RAM, 20GB Disk.
- **Stack**: Includes Docker, Traefik (Edge), Pi-hole DNS sync, and automated monitoring.
- **Observability**: Automatically joins the Grafana Loki/Prometheus stack via Alloy.

## Roles Used
- `lxc-ubuntu`: Base container creation.
- `common`: Base system configuration.
- `docker`: Docker engine installation.
- `traefik`: Edge proxy configuration.
- `pihole-dns-sync`: Automated DNS management.
- `beszel-agent`: Hardware resource monitoring.
- `grafana-alloy`: Integrated logging and metrics.
