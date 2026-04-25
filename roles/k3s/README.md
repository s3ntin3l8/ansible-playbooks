# Role: k3s
Installs and configures K3s (Lightweight Kubernetes).

## Tasks
- **Installation**: Downloads and runs the official K3s installer script.
- **LXC Support**: Handles specific requirements for running K3s in LXC (e.g., `/dev/kmsg` symlink).
- **Service**: Ensures the K3s service is enabled and started (Server or Agent mode).
- **Verification**: Waits for the cluster to be ready and verifies node status with `kubectl`.
