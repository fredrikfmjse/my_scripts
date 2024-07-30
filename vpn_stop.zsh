#!/bin/zsh

#!/bin/zsh

# Function to stop all OpenVPN connections
stop_all_vpn() {
  echo "Stopping all OpenVPN connections..."
  sudo killall openvpn
}

# Function to start Mullvad VPN
start_mullvad_vpn() {
  echo "Starting Mullvad VPN..."
  mullvad connect
}

# Stop all OpenVPN connections
stop_all_vpn

# Start Mullvad VPN
start_mullvad_vpn

