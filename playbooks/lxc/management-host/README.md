# Management LXC

Provisions and configures the central Management LXC container (vmid: 101).

## Features

- **Resources**: 2 Cores, 4GB RAM, 20GB Disk.
- **Tools**: Includes Docker, Ansible (in venv), and AI development tools (Claude CLI).
- **Observability Hub**: Deploys the central Grafana, Loki, and Prometheus stack.
- **Monitoring**: Includes automated agents for self-monitoring.
- **Infrastructure Services**: Includes Beszel Hub and NetBox (IPAM).

## Roles Used

- `lxc-ubuntu`: Base container creation.
- `common`: Base system configuration.
- `docker`: Docker engine installation.
- `ai-tools`: AI specific CLI tools.
- `observability-hub`: Central monitoring stack.
- `beszel-agent`: Hardware resource monitoring.
- `grafana-alloy`: Integrated logging and metrics.
