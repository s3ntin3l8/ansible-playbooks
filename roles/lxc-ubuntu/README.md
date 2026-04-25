# Role: lxc-ubuntu
Automates the creation and initial bootstrap of Ubuntu-based LXC containers on Proxmox.

## Tasks
- **Provisioning**: Downloads the latest Ubuntu template and creates the container.
- **Networking**: Automatically retrieves the container's IP and registers it in Pi-hole DNS.
- **Inventory**: Persistently adds the new container to the Ansible `inventory.yml`.
- **Bootstrap**: Configures SSH keys for immediate Ansible management.
