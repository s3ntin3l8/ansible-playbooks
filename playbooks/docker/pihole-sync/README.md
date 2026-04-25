# Pi-hole DNS Sync
Deploys the Pi-hole DNS synchronization service.

## Purpose
This service monitors Docker containers across the infrastructure and automatically updates Pi-hole local DNS records based on container labels (e.g., `pihole.dns`).

## Roles Used
- `pihole-dns-sync`: Handles the deployment of the sync script and its cron/service configuration.
