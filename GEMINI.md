# Gemini CLI Foundation - Ansible Workspace

This document provides foundational mandates and context for this workspace.

## Mandates

- **Venv Execution:** All commands MUST run from the virtual environment: `~/ansible/venv`.
- **Keyless Security:** NEVER store private SSH keys on this VM. Use **SSH Agent Forwarding** (via 1Password) from your local machine.
- **Identity-First:** Perform all operations as user `bjoern`. Use the `ansible` user only for automation/service identity.
- **Global Config:** Always use the root `ansible.cfg` and `inventory.yml`. Do not create local inventory files in playbook directories.

## Workspace Context

- **Proxmox Host:** Target host is defined in `.env` as `PROXMOX_HOST_IP`.
- **Identity Provisioning:** Every deployment (LXC/VM) must provision:
    - `ansible`: For automated management (passwordless sudo).
    - `bjoern`: For personal access (passwordless sudo, GitHub keys).
- **Docker Support:** LXC containers require `nesting=1,keyctl=1` and `unprivileged=1`.

## Configuration Logic (Obfuscation)

The repository uses a split configuration strategy to remain shareable while staying secure:

- **`.env` File (Local Only):** Stores "semi-sensitive" environment structural data (IPs, subnets, usernames, public keys). This file is ignored by Git. Use `.env.example` as a template.
- **`ansible-vault` (`vault.yml`):** Stores true cryptographic secrets (API token secrets, auth keys, passwords).
- **Just-in-Time Templating:** The `proxmox.yml` and `inventory.yml` files are dynamically rendered from `.j2` templates via `make prepare` using values from the `.env` file.

## Common Workflows (Use Makefile)

- **`make prepare`**: Render inventories from `.env`. (Called automatically by other targets).
- **`make dev-box`**: Deploy the specialized AI/Dev LXC container (`dev-01`).
- **`make lxc`**: Provision a standard Ubuntu LXC.
- **`make alpine`**: Provision a standard Alpine LXC.
- **`make vm`**: Provision new VM.
- **`make destroy id=X`**: Teardown LXC and cleanup DNS/Inventory.
- **`make inv`**: View rendered inventory graph.
- **`make check`**: Validate playbook syntax.

## LXC Naming & ID Scheme

IDs and hostnames are calculated based on `lxc_type` and `lxc_index`:
- **Core (100+)**: Infrastructure (Pi-hole, Tailscale).
- **Docker (300+)**: Docker hosts.
- **K3s (400+)**: Kubernetes nodes.
- **Dev (500+)**: Development boxes.
- **OpenClaw (600+)**: OpenClaw application nodes.
