.PHONY: help lxc vm maint inv check list management destroy dev-box management-lxc

# Variables
VENV := ./venv/bin/activate
# Load .env if it exists
ifneq ("$(wildcard .env)","")
    include .env
    export $(shell sed 's/=.*//' .env)
endif

ANSIBLE_BASE := . $(VENV) && 
ANSIBLE := $(ANSIBLE_BASE) ansible-playbook
INVENTORY := ./inventory.yml

.PHONY: help lxc vm maint inv check list management destroy prepare

help:
	@echo "Available commands:"
	@echo "  make prepare    - Render dynamic inventory from .env"
	@echo "  make lxc        - Deploy a new Ubuntu LXC container"
	@echo "  make vm         - Deploy a new Ubuntu VM from template"
	@echo "  make management-lxc - Deploy a new Management LXC (Ubuntu, ID 100)"
	@echo "  make destroy id=123 - Stop, destroy LXC and cleanup DNS/Inventory"
	@echo "  make maint      - Run Proxmox host maintenance (updates, cleanup)"
	@echo "  make inv        - Show dynamic/static inventory graph"
	@echo "  make check      - Run syntax check on all playbooks"
	@echo "  make list       - List all managed hosts"
	@echo "  make management - Deploy management apps (Uptime Kuma, NetBox)"
	@echo "  make pihole     - Install Pi-hole v6 (Bare Metal)"
	@echo "  make k3s        - Deploy K3s on Proxmox LXC"
	@echo "  make alpine     - Deploy a new Alpine LXC container"
	@echo "  make docker-alpine - Deploy an Alpine Docker Host"
	@echo "  make docker-ubuntu - Deploy an Ubuntu Docker Host"
	@echo "  make f1-timing  - Deploy F1 Replay Timing application"

prepare:
	@if [ ! -f .env ]; then echo "Error: .env file missing. Copy .env.example to .env and fill in your values."; exit 1; fi
	@echo "🛠️  Preparing Proxmox and Static inventories..."
	@$(ANSIBLE_BASE) ansible localhost -m template -a "src=proxmox.yml.j2 dest=proxmox.yml" > /dev/null
	@$(ANSIBLE_BASE) ansible localhost -m template -a "src=inventory.yml.j2 dest=inventory.yml" > /dev/null
	@$(ANSIBLE_BASE) ansible localhost -m template -a "src=netbox_inventory.yml.j2 dest=netbox_inventory.yml" > /dev/null

lxc: prepare
	@echo "🚀 Deploying Ubuntu LXC..."
	$(ANSIBLE) playbooks/lxc/ubuntu/playbook.yml

dev-box: prepare
	@echo "🚀 Deploying Dev Box..."
	$(ANSIBLE) playbooks/lxc/dev-box/playbook.yml

management-lxc: prepare
	@echo "🚀 Deploying Management LXC..."
	$(ANSIBLE) playbooks/lxc/management-host/playbook.yml

alpine: prepare
	@echo "🚀 Deploying Alpine LXC..."
	$(ANSIBLE) playbooks/lxc/alpine/playbook.yml

f1-timing: prepare
	@echo "🚀 Deploying F1 Replay Timing..."
	$(ANSIBLE) playbooks/docker/f1-timing/playbook.yml

docker-alpine: prepare
	@echo "🚀 Deploying Alpine Docker Host..."
	$(ANSIBLE) playbooks/lxc/docker-host-alpine/playbook.yml

docker-ubuntu: prepare
	@echo "🚀 Deploying Ubuntu Docker Host..."
	$(ANSIBLE) playbooks/lxc/docker-host-ubuntu/playbook.yml

destroy: prepare
	@if [ -z "$(id)" ]; then \
		echo "Error: You must provide an id. Example: make destroy id=601"; \
		exit 1; \
	fi
	@echo "⚠️  Destroying LXC $(id)..."
	$(ANSIBLE) playbooks/maintenance/lxc-destroy/playbook.yml -e lxc_vmid=$(id)

pihole: prepare
	@echo "🚀 Installing Pi-hole on Ubuntu..."
	$(ANSIBLE) playbooks/lxc/pihole-ubuntu/playbook.yml

pihole-alpine: prepare
	@echo "🚀 Installing Pi-hole on Alpine..."
	$(ANSIBLE) playbooks/lxc/pihole-alpine/playbook.yml

k3s: prepare
	@echo "🚀 Deploying K3s..."
	$(ANSIBLE) playbooks/lxc/k3s/playbook.yml

vm: prepare
	@echo "🚀 Deploying VM..."
	$(ANSIBLE) playbooks/vm/deploy/playbook.yml

maint: prepare
	@echo "🛠️  Running Maintenance..."
	$(ANSIBLE) playbooks/maintenance/proxmox/playbook.yml

inv: prepare
	@echo "📊 Current Inventory Graph:"
	@$(ANSIBLE_BASE) ansible-inventory --graph

check: prepare
	@echo "📋 Checking Playbook Syntax..."
	$(ANSIBLE) playbooks/lxc/ubuntu/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/lxc/alpine/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/vm/deploy/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/maintenance/proxmox/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/docker/monitoring/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/lxc/pihole-ubuntu/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/lxc/pihole-alpine/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/lxc/k3s/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/lxc/dev-box/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/lxc/management-host/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/lxc/docker-host-alpine/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/lxc/docker-host-ubuntu/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/maintenance/pihole-update/playbook.yml --syntax-check
	$(ANSIBLE) playbooks/lxc/traefik/playbook.yml --syntax-check

management: prepare
	@echo "🚀 Deploying Management Apps..."
	$(ANSIBLE) playbooks/docker/monitoring/playbook.yml

traefik-gateway: prepare
	@echo "🚀 Deploying Traefik Gateway..."
	$(ANSIBLE) playbooks/lxc/traefik/playbook.yml

list: prepare
	@echo "📋 Managed Host List:"
	@$(ANSIBLE_BASE) ansible-inventory --list | grep -oE '\"ansible_host\": \"[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\"' | cut -d'\"' -f4 | sort -u
