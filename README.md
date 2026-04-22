<p align="center">
  <img src="assets/logo.png" width="200" alt="S3ntin3l8 Logo">
</p>

# Ansible Infrastructure - Proxmox & OpenClaw

Automated management and deployment playbooks for a Proxmox-based infrastructure, including LXC/VM provisioning and OpenClaw application deployment.

## 🚀 Overview

This repository contains the foundational Ansible playbooks and configuration for managing a self-hosted environment on a Proxmox host (`<PROXMOX_IP>`).

### Key Capabilities

*   **LXC Provisioning:** Automated creation and configuration of Ubuntu-based LXC containers.
*   **VM Provisioning:** Automated deployment of Ubuntu VMs from cloud-init templates.
*   **Maintenance:** Automated host maintenance (updates, cleanup) for the Proxmox host.
*   **OpenClaw Deployment:** Specialized playbooks for deploying the [OpenClaw](https://github.com/openclaw/openclaw) project.
*   **Tailscale Integration:** Support for Tailscale VPN deployment.
*   **Proxmox Branding:** Automated "Notes" generation with branding and deployment metadata for all new containers.

## 🛠️ Prerequisites

*   **Ansible:** 2.15+ (installed in the local `venv`).
*   **Proxmox:** API access configured with an API token.
*   **Secrets:** Managed via `ansible-vault` with the password stored in `~/.vault_pass.txt`.
*   **SSH:** SSH agent forwarding is used for secure host access.

## 📖 Quick Start

All common operations are handled through the `Makefile` for simplicity.

```bash
# Display available commands
make help

# Run host maintenance
make maint

# Deploy specialized boxes
make dev-box
make management-lxc
make f1-timing

# Check inventory
make inv
```

## 🏗️ LXC Naming & ID Scheme

The environment uses a centralized naming and numbering scheme for LXC containers. This ensures consistent IDs and hostnames across all playbooks.

| Type (`lxc_type`) | ID Range | Prefix | Purpose |
| :--- | :--- | :--- | :--- |
| `core` | 101+ | `core` | Infrastructure (Pi-hole, Tailscale, etc.) |
| `docker` | 301+ | `docker` | Docker container hosts |
| `k3s` | 401+ | `k3s` | Kubernetes nodes |
| `dev` | 501+ | `dev` | Development boxes |
| `openclaw` | 601+ | `openclaw` | OpenClaw application nodes |
| `generic` | 901+ | `lxc` | Temporary or test containers |

### Usage

The `lxc_vmid` and `lxc_hostname` are automatically calculated based on the `lxc_type` and `lxc_index` (default: 1).

*   **Default (Core #1)**: `make lxc` (ID: **101**, Hostname: **core-01**)
*   **Docker #5**: `ansible-playbook ... -e lxc_type=docker -e lxc_index=5` (ID: **305**, Hostname: **docker-05**)
*   **K3s #2**: `ansible-playbook ... -e lxc_type=k3s -e lxc_index=2` (ID: **402**, Hostname: **k3s-02**)

*Note: You can still manually override `lxc_vmid` or `lxc_hostname` via `-e` if needed.*

## 📂 Project Structure

*   `inventory.yml` - Static inventory.
*   `proxmox.yml` - Dynamic inventory plugin for Proxmox.
*   `playbooks/` - Specialized playbooks for different tasks.
    *   `lxc-ubuntu/` - Ubuntu LXC provisioning logic.
    *   `lxc-alpine/` - Alpine LXC provisioning logic.
    *   `deploy-vm/` - VM provisioning logic.
    *   `deploy-openclaw/` - OpenClaw installer.
    *   `deploy-f1-timing.yml` - F1 Replay Timing app deployment.
    *   `deploy-management-lxc.yml` - Infrastructure management container.
    *   `backup-pihole.yml` - Pi-hole configuration backup.
*   `roles/` - Shared Ansible roles.
*   `group_vars/` - Variable definitions (including encrypted secrets).
*   `assets/` - Brand assets and logos.

## 🔒 Security

*   **Vault:** Sensitive data (API tokens, passwords) are encrypted in `vault.yml` files.
*   **No Private Keys:** Private SSH keys are never stored on this VM; use agent forwarding.
*   **User Identity:** Management operations use the `ansible` user, while personal access is configured for the primary user (configured via `PRIMARY_USER` in `.env`).

## 📜 License

This project is licensed under the MIT License - see the `LICENSE` file for details.
