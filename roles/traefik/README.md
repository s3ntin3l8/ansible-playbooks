# Role: traefik
Deploys and configures the Traefik reverse proxy.

## Tasks
- **Configuration**: Deploys static and dynamic YAML configurations.
- **SSL/TLS**: Supports Let's Encrypt / ACME with DNS-01 challenge (Cloudflare).
- **Modes**:
  - **Gateway**: Full reverse proxy with dashboard and external exposure.
  - **Edge**: Local container discovery and routing.
- **Docker**: Runs as a Docker container with access to the Docker socket for auto-discovery.
