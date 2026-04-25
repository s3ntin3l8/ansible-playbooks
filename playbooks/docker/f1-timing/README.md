# F1 Replay Timing
Deploys the F1 Replay Timing application as a Docker container.

## Features
- **App**: Pulls the latest image from GitHub Container Registry.
- **Data**: Mounts local volumes for data and FastF1 cache.
- **Secrets**: Injects the OpenRouter API key for LLM-enhanced timing analysis.
- **Networking**: Automatically registers a Pi-hole DNS entry (`f1.{{ traefik_domain }}`).

## Usage
Ensure `DOCKER_APPS_PATH` is set in your environment (default: `~/appdata`).
