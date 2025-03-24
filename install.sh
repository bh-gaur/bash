#!/bin/bash

# Update package list first
sudo apt update

# Install dependencies for adding Nginx repository
sudo apt install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring

# Add Nginx signing key
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

# Import the key for verification
sudo gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

# Add the Nginx repository
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list

# Pin Nginx packages to the Nginx origin
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" | sudo tee /etc/apt/preferences.d/99nginx

# Update package list again after adding new repo
sudo apt update

# Install Nginx
sudo apt install -y nginx

# Check nginx version
nginx -v

# Start and enable nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Verify nginx service status
sudo systemctl status nginx
