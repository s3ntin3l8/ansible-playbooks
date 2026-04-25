# Alpine Docker Host
Provisions an ultra-lightweight Alpine-based Docker host with Traefik integration and automated monitoring.

## Features
- **Resources**: 2 Cores, 2GB RAM, 20GB Disk.
- **Stack**: Includes Docker, Traefik (Edge), Pi-hole DNS sync, and automated monitoring.
- **Observability**: Automatically joins the Grafana Loki/Prometheus stack via Alloy.

## Roles Used
- `lxc-alpine`: Base container creation.
- `common`: Base system configuration.
- `docker`: Docker engine installation.
- `traefik`: Edge proxy configuration.
- `pihole-dns-sync`: Automated DNS management.
- `beszel-agent`: Hardware resource monitoring.
- `grafana-alloy`: Integrated logging and metrics.
