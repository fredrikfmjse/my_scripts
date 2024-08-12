#!/bin/zsh

# Function to stop Mullvad VPN
stop_mullvad_vpn() {
  echo "Stopping Mullvad VPN..."
  mullvad disconnect
}

# Directory where your VPN config files are stored
config_dir="/etc/openvpn/client"

# List the available .ovpn files
config_files=($config_dir/*.ovpn)

# Display the available .ovpn files without the .ovpn extension
echo "Available VPN configurations:"
for file in $config_files; do
  echo " - $(basename "${file}" .ovpn)"
done

# Prompt the user to enter the VPN config file name
echo "Enter the name of the VPN configuration file (without .ovpn extension):"
read -r config_name

# Construct the full path to the config file
config_file="$config_dir/$config_name.ovpn"

# Check if the file exists
if [[ -f "$config_file" ]]; then
  # Stop Mullvad VPN
  stop_mullvad_vpn

  # Start the new VPN connection
  sudo openvpn --config "$config_file" --daemon
  echo "Started VPN using $config_file"
else
  echo "Configuration file $config_file does not exist. Exiting."
  exit 1
fi
