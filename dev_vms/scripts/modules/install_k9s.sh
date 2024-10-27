#!/bin/bash

# Log the installation start
echo "Installing K9s..."

# Set the version of K9s you want to install
K9S_VERSION=$(curl -s "https://api.github.com/repos/derailed/k9s/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')

# Download the K9s binary for Linux
curl -Lo k9s.tar.gz "https://github.com/derailed/k9s/releases/download/$K9S_VERSION/k9s_Linux_amd64.tar.gz"

# Extract the binary and move it to /usr/local/bin
tar -xzf k9s.tar.gz k9s
sudo mv k9s /usr/local/bin/

# Clean up
rm k9s.tar.gz

# Confirm installation
echo "K9s installed successfully."
k9s version