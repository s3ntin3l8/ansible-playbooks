# Role: common
Handles base system configuration, security hardening, and essential package installation across all Linux distributions (Ubuntu/Alpine).

## Tasks
- **Hardening**: Configures passwordless sudo for the primary user.
- **SSH**: Installs public keys from GitHub for the primary user.
- **Packages**: Installs essential utilities (`curl`, `git`, `vim`, `htop`, etc).
- **Maintenance**: Updates the package cache.
