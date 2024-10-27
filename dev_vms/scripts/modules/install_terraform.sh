#!/bin/bash

# Log the installation start
echo "Installing Terraform..."

# Add HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add the HashiCorp repository
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Update the package list and install Terraform
sudo apt-get update -y
sudo apt-get install -y terraform

# Confirm installation
echo "Terraform installed successfully."
terraform -version