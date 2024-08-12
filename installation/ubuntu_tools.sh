#!/bin/bash

# Update and Upgrade
sudo apt update && sudo apt upgrade -y

# Install Basic Utilities
sudo apt install -y curl wget vim nano git htop unzip zip ufw net-tools traceroute openssh-server build-essential python3 python3-pip nodejs npm mysql-server postgresql postgresql-contrib docker.io nmap logwatch tmux jq sudo

# Enable and Configure UFW
#sudo ufw enable
#sudo ufw allow ssh

# Start and Enable Docker
#sudo systemctl start docker
#sudo systemctl enable docker
#sudo usermod -aG docker ${USER}

# Enable and Start Fail2ban
#sudo systemctl enable fail2ban
#sudo systemctl start fail2ban

echo "All packages installed and basic configurations done. Please log out and log back in to apply the Docker group changes."

