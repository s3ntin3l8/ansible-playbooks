# Destroy LXC Container

Stops and removes an LXC container from Proxmox and cleans up related infrastructure.

## Features

- **Proxmox**: Stops and removes the container.
- **Pi-hole**: Removes DNS entries for the container.
- **Inventory**: Cleans up entries in NetBox (if applicable).

## Usage

```bash
ansible-playbook playbooks/maintenance/lxc-destroy/playbook.yml -e lxc_vmid=123
```
