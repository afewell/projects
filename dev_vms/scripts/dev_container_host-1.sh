#!/bin/bash

# Function to log messages
log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1"
}

# Update package list
log "Updating package list..."
sudo apt-get update -y

# Install Docker if not already installed
if ! command -v docker &> /dev/null; then
    log "Docker not found. Installing Docker..."
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update -y
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    log "Docker installed successfully."
else
    log "Docker is already installed. Skipping Docker installation."
fi

# Install Docker Compose if not already installed
if ! command -v docker-compose &> /dev/null; then
    log "Docker Compose not found. Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    log "Docker Compose installed successfully."
else
    log "Docker Compose is already installed. Skipping Docker Compose installation."
fi

# Install VSCode if not already installed
if ! command -v code &> /dev/null; then
    log "VSCode not found. Installing VSCode..."
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo mv packages.microsoft.gpg /usr/share/keyrings/
    echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
    sudo apt-get update -y
    sudo apt-get install -y code
    log "VSCode installed successfully."
else
    log "VSCode is already installed. Skipping VSCode installation."
fi

# Install common utilities if missing
common_utilities=(curl git jq htop)
for util in "${common_utilities[@]}"; do
    if ! command -v "$util" &> /dev/null; then
        log "Installing $util..."
        sudo apt-get install -y "$util"
        log "$util installed successfully."
    else
        log "$util is already installed. Skipping $util installation."
    fi
done

log "Setup complete."
