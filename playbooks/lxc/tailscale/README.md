# Tailscale Subnet Router
Provisions and configures a Tailscale Subnet Router on a Proxmox LXC container.

## Features
- **Networking**: Configures native TUN/TAP device support in LXC for Tailscale.
- **Subnet Routing**: Automatically advertises the local subnet (defined in `.env`) to the Tailscale network.
- **Hardening**: Uses the `common` role for base security.

## Roles Used
- `lxc-ubuntu`: Base container creation with custom device/mount rules.
- `common`: Base system configuration.
- `tailscale`: Tailscale installation and authentication.
