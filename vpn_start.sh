#! /bin/bash

# Define all availible VPN configurations
# Save the .ovpn files in /etc/openvpn/client/ and write the name of the file below 
# without .ovpn extension
vpn_options=("FMJ")

# Function to display the menu
function show_menu {
    echo "Select the VPN connection you'd like to open:"
    for i in "${!vpn_options[@]}"; do
        printf "%s) %s\n" "$i" "${vpn_options[$i]}"
    done
}

# Function to start the selected VPN
function start_vpn {
	local choice=$1
	sudo openvpn --config "/etc/openvpn/client/${vpn_options[$choice]}.ovpn" --daemon
}

# Function to stop Mullvad VPN
function stop_mullvad_vpn {
    echo "Stopping Mullvad VPN..."
    sudo systemctl stop mullvad-vpn

# Display the menu
show_menu

# Read the user's choice
read -p "Enter your choice [0-$((${#vpn_options[@]}-1))]: " choice

# Validate the input and start the VPN
if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 0 ] && [ "$choice" -lt "${#vpn_options[@]}" ]; then
    echo "Starting VPN: ${vpn_options[$choice]}"
    start_vpn "$choice"
else
    echo "Invalid choice. Please run the script again."
    exit 1
fi

# Original code
##sudo openvpn --config /etc/openvpn/client/FMJ.ovpn --daemon
