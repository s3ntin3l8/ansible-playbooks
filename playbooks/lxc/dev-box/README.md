# AI/Dev Box

Provisions a specialized LXC container optimized for AI development and heavy compilation.

## Features

- **Resources**: 4 Cores, 8GB RAM, 50GB Disk.
- **Hardware**: Integrated AMD GPU passthrough (ROCm ready).
- **Stack**: Includes Docker, dev-tools, AI toolsets (Claude CLI, etc.), and automated monitoring.
- **Observability**: Automatically joins the Grafana Loki/Prometheus stack via Alloy.

## Roles Used

- `lxc-ubuntu`: Base container creation.
- `lxc-gpu`: GPU passthrough configuration.
- `common`: Base system configuration.
- `docker`: Docker engine installation.
- `dev-environment`: IDE and CLI toolsets.
- `ai-tools`: AI specific CLI tools.
- `beszel-agent`: Hardware resource monitoring.
- `grafana-alloy`: Integrated logging and metrics.
