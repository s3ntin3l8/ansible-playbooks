# Role: pihole-dns-sync
Deploys a Python-based synchronization service that automates Pi-hole DNS records based on Docker container labels.

## Tasks
- **Deployment**: Runs a lightweight Python container that monitors the local Docker socket.
- **Sync Logic**: Automatically registers DNS records in Pi-hole for containers with the `pihole.dns` label.
- **Persistence**: Deploys the sync script and its requirements as a Docker volume.
