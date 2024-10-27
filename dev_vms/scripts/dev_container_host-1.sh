#!/bin/bash
# Install script for dev_container_host-1
# Everything in this script should be idempotent

# Function to log messages with timestamps
log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1"
}

# Update package list
log "Updating package list..."
sudo apt-get update -y

# Install Apps with simple 1 line apt install
## Define list of apps
simple_apt_installs=(
    curl
    git
    jq
    htop
    tree
    make
    tmux
    net-tools
    iftop
    dstat
    iotop
    ncdu
    python3
    python3-pip
    python3-venv
    npm
    nodejs
    golang
    )
## Execute install of 1-line apt packages
log "Installing 1-line apt packages..."
sudo apt-get install -y "${common_utilities[@]}"

for util in "${common_utilities[@]}"; do
    if ! command -v "$util" &> /dev/null; then
        log "Installing $util..."
        sudo apt-get install -y "$util"
        log "$util installed successfully."
    else
        log "$util is already installed. Skipping $util installation."
    fi
done

# Install apt packages that require multi-line installations
## Define list of scripts to install apt packages that require multiple command (eg adding a specific apt repo/gpg key etc...)

# Run installation or configuration scripts that are inherently idempotent

# Call modules for more complex installations

# Visual Studio Code with extensions
if ! command -v code &> /dev/null; then
    log "VSCode not found. Running VSCode installation script..."
    ./modules/install_vscode.sh
else
    log "VSCode is already installed. Skipping VSCode installation."
fi

# Docker
if ! command -v docker &> /dev/null; then
    log "Docker not found. Running Docker installation script..."
    ./modules/install_docker.sh
else
    log "Docker is already installed. Skipping Docker installation."
fi

# Pack CLI
if ! command -v pack &> /dev/null; then
    log "Pack CLI not found. Running Pack CLI installation script..."
    ./modules/install_packcli.sh
else
    log "Pack CLI is already installed. Skipping Pack CLI installation."
fi

# K9s
if ! command -v k9s &> /dev/null; then
    log "K9s not found. Running K9s installation script..."
    ./modules/install_k9s.sh
else
    log "K9s is already installed. Skipping K9s installation."
fi

# Minikube
if ! command -v minikube &> /dev/null; then
    log "Minikube not found. Running Minikube installation script..."
    ./modules/install_minikube.sh
else
    log "Minikube is already installed. Skipping Minikube installation."
fi

# Kubectl
if ! command -v kubectl &> /dev/null; then
    log "Kubectl not found. Running Kubectl installation script..."
    ./modules/install_kubectl.sh
else
    log "Kubectl is already installed. Skipping Kubectl installation."
fi

# Skaffold
if ! command -v skaffold &> /dev/null; then
    log "Skaffold not found. Running Skaffold installation script..."
    ./modules/install_skaffold.sh
else
    log "Skaffold is already installed. Skipping Skaffold installation."
fi

# Additional languages
for lang in python nodejs go; do
    if ! command -v "$lang" &> /dev/null; then
        log "$lang not found. Running $lang installation script..."
        ./modules/install_${lang}.sh
    else
        log "$lang is already installed. Skipping $lang installation."
    fi
done

log "Setup complete."
