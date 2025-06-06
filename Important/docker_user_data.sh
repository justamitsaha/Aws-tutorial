#!/bin/bash
set -euxo pipefail

# Update the system
dnf update -y

# Install Git
dnf install -y git

# Install Docker
dnf install -y docker

# Start and enable Docker service
systemctl enable --now docker

# Add ec2-user to the docker group (optional: allows running docker without sudo)
usermod -aG docker ec2-user

# Enable Docker CLI plugins directory
mkdir -p /usr/libexec/docker/cli-plugins

# Download Docker Compose v2 as a plugin
DOCKER_COMPOSE_VERSION="v2.27.0"
curl -SL "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" \
  -o /usr/libexec/docker/cli-plugins/docker-compose

# Make it executable
chmod +x /usr/libexec/docker/cli-plugins/docker-compose

# Verify installations
docker --version
docker compose version
git --version
