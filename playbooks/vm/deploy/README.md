# VM Deployment
Provisions an Ubuntu-based Virtual Machine from a Proxmox cloud-init template.

## Features
- **Cloning**: Clones from a specified template ID.
- **Hardware**: Configures cores, memory, and network bridge.
- **Cloud-init**: Attaches custom cloud-init user-data for initial provisioning.
- **Inventory**: Automatically adds the new VM's IP address to the `inventory.yml` file.
- **Post-Provisioning**: Hardens SSH (disables password auth) and creates the primary user with GitHub public keys.

## Roles Used
- Uses standalone tasks for VM management via `qm` commands.
