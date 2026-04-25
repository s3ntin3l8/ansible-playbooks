# Infrastructure Observability Hub

A premium, unified monitoring and logging stack based on the **LGTM** (Loki, Grafana, Tempo, Mimir/Prometheus) ecosystem, supplemented by Gatus for uptime and Beszel for hardware health.

## Deployment Map (What is where?)

### 1. Central Management Hub (on `management` LXC)

The brain of the operation, deployed as a single Docker Compose stack on your dedicated management host:

- **Grafana**: Dashboard UI and alerting rules.
- **Loki**: Log database (receives logs from Alloy & Unraid).
- **Prometheus**: Metric database (scrapes Alloy, Gatus, PVE, and apps).
- **Alertmanager**: Routes alerts to Discord.
- **Gatus**: The public-facing status page (`status.yourdomain.com`).
- **Blackbox Exporter**: Probes endpoints for uptime.
- **PVE Exporter**: Connects to the Proxmox API for cluster & storage metrics.
- **Pi-hole Exporter**: Connects to your Pi-hole instances for network health metrics.

### 2. Edge Agents (on **every** host: Proxmox, LXC, Docker Nodes)

Lightweight agents that feed data back to the Hub:

- **Grafana Alloy**: The universal "shipper".
  - Ships **Logs** (journald, /var/log, Docker logs, Pi-hole logs).
  - Ships **Metrics** (CPU, RAM, Disk, Network, Container stats).
  - **Deployment Logic**: Favors `systemd` on Proxmox/LXC for full visibility and `docker` on dedicated hosts.
- **Beszel Agent**: A secondary, ultra-lightweight hardware monitor.

### 3. External & Advanced Integrations

- **Unraid NAS**: Pushes logs via Syslog and is scraped via Prometheus Exporter.
- **Pi-hole**: Metrics scraped via hub exporter; logs shipped via Alloy.
- **NetBox (IPAM)**: Integrated as an **Ansible Dynamic Inventory** source. Adding a device in NetBox automatically adds it to your monitoring and deployment fleet.

## Configuration & Setup

### 1. Discord Alerts

To enable Discord notifications, add your webhook URL to `group_vars/all/vault.yml`:

```yaml
discord_webhook_url: "https://discord.com/api/webhooks/..."
```

### 2. NetBox Integration

To use NetBox as your inventory source:
1. Generate an API token in NetBox.
2. Add `NETBOX_URL` and `NETBOX_TOKEN` to your `.env` file.
3. Run `make prepare` to update the inventory plugin.

### 3. Unraid Integration

- **Logs**: In Unraid, go to `Settings > Syslog Server`. Set `Remote syslog server` to the IP of your Management host.
- **Metrics**: Install the `Prometheus Exporter` plugin and ensure the host is in the `unraid` inventory group.

### 4. Dashboards

The following dashboards are **automatically provisioned**:
- **ID 1860**: Node Exporter Full (Resources).
- **ID 193**: Docker Container Monitoring.
- **ID 7522**: Blackbox Exporter (Uptime).
- **ID 10347**: Proxmox Cluster Overview.
- **ID 10176**: Pi-hole Network Health.

## Roles

- `observability-hub`: Deploys the central Docker stack.
- `grafana-alloy`: Deploys the universal agent to all nodes.
- `beszel-agent`: Maintains lightweight hardware health monitoring.
