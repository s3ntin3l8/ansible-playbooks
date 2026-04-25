# Role: lxc-alpine
Automates the creation and initial bootstrap of Alpine-based LXC containers on Proxmox.

## Tasks
- **Provisioning**: Downloads the latest Alpine template and creates the container.
- **Bootstrap**: Installs required packages (`python3`, `sudo`, etc.) for Ansible compatibility.
- **Networking**: Automatically retrieves the container's IP and registers it in Pi-hole DNS.
- **Inventory**: Persistently adds the new container to the Ansible `inventory.yml`.
