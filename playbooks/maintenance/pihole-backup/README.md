# Pi-hole Backup
Backs up Pi-hole v6 configuration and system hosts files.

## Features
- **Teleporter**: Uses `pihole-FTL --teleporter` to generate a full configuration archive.
- **Hosts File**: Also backs up `/etc/hosts` to preserve local static mappings.
- **Local Storage**: Fetches the backup files to the `backups/pihole/` directory on the Ansible controller.
- **Timestamped**: Backups are stored in dated subdirectories.
