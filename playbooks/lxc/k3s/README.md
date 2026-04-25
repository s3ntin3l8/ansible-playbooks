# K3s Cluster Deployment
Provisions and configures a K3s (Lightweight Kubernetes) node on a Proxmox LXC container.

## Features
- **Host Preparation**: Automatically loads required kernel modules (`overlay`, `br_netfilter`) and enables IP forwarding on the Proxmox host.
- **LXC Configuration**: Deploys an Ubuntu LXC with specialized flags (`unconfined` apparmor, full cgroup access) required for running Kubernetes in a container.
- **K3s Stack**: Installs K3s with optional flags (default: disables Traefik and ServiceLB to use external gateway).

## Roles Used
- `lxc-ubuntu`: Base container creation with k3s-specific overrides.
- `common`: Base system configuration.
- `k3s`: K3s binary installation and service configuration.
