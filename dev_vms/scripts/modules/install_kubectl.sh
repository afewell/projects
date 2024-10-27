#!/bin/bash

# Log the installation start
echo "Installing kubectl..."

# Add the Google Cloud public signing key
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# Add the Kubernetes apt repository
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update the package list and install kubectl
sudo apt-get update -y
sudo apt-get install -y kubectl

# Confirm installation
echo "kubectl installed successfully."
kubectl version --client