# Role: pihole
Installs and configures Pi-hole v6 (Bare Metal).

## Tasks
- **Prerequisites**: Installs system dependencies and generates password hashes.
- **Configuration**: Deploys the new Pi-hole v6 `pihole.toml` configuration.
- **Installation**: Downloads and runs the official Pi-hole installer in unattended mode.
- **Service**: Ensures `pihole-FTL` is started and enabled.
