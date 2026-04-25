# Role: lxc-gpu
Configures GPU passthrough for Proxmox LXC containers.

## Tasks
- **Host Side**: Configures device passthrough (e.g., `/dev/dri`) on the Proxmox host.
- **Container Side**: Maps device nodes into the container and installs required drivers (AMD or NVIDIA).
