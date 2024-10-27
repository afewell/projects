#!/bin/bash

# Log the installation start
echo "Installing Helm..."

# Add the Helm GPG key
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -

# Add the Helm apt repository
sudo apt-add-repository "deb https://baltocdn.com/helm/stable/debian/ all main"

# Update the package list and install Helm
sudo apt-get update -y
sudo apt-get install -y helm

# Confirm installation
echo "Helm installed successfully."
helm version