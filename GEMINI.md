# Gemini CLI Foundation - Ansible Workspace

This document provides foundational mandates and context for this workspace.

## Mandates

- **Venv Execution:** All commands MUST run from the virtual environment: `~/ansible/venv`.
- **Keyless Security:** NEVER store private SSH keys on this VM. Use **SSH Agent Forwarding** from your local machine.
- **Identity-First:** Perform all operations as the primary user (default: `bjoern`). Use the `ansible` user only for automation.
- **Global Config:** Always use the root `ansible.cfg` and `inventory.yml`. No local inventory files.
- **Observability-First:** Every host MUST be provisioned with **Grafana Alloy** and **Beszel Agent** for immediate enrollment in the monitoring hub.

## Workspace Context

- **Management Hub (vmid: 101):** The centralized "Control Tower" hosting Ansible, Grafana, Loki, Prometheus, NetBox, and Beszel Hub.
- **Identity Provisioning:** Every deployment (LXC/VM) provisions the `ansible` user and the `primary user`.
- **Docker Support:** LXC containers require `nesting=1,keyctl=1,unprivileged=1`.

## Configuration Logic (Obfuscation)

- **`.env` File (Local Only):** Stores IPs, subnets, and structural data. Ignored by Git.
- **`ansible-vault`:** Stores cryptographic secrets (API tokens, passwords).
- **JIT Templating:** Inventories (`inventory.yml`, `proxmox.yml`, `netbox_inventory.yml`) are rendered from `.j2` templates via `make prepare`.

## Common Workflows (Use Makefile)

- **`make prepare`**: Render all dynamic inventories from `.env`.
- **`make management-lxc`**: Deploy the central Management/Observability hub.
- **`make lxc` / `make alpine`**: Provision standard containers (includes auto-monitoring).
- **`make dev-box`**: Deploy specialized AI/Dev LXC (`dev-01`).
- **`make inv`**: View the unified inventory graph (Proxmox + Static + NetBox).

## LXC Naming & ID Scheme

- **Core (100+)**: Infrastructure (Management: 101, Pi-hole, Tailscale).
- **Docker (300+)**: Dedicated Docker application hosts.
- **K3s (400+)**: Kubernetes cluster nodes.
- **Dev (500+)**: High-performance development boxes.
- **OpenClaw (600+)**: Application-specific nodes.
