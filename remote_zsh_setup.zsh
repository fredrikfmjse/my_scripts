#! /bin/zsh

# Prompt for remote server details
read "server_ip?Enter remote server IP: "
read "username?Enter username: "
read "password?Enter password: "

# Verify connection details
echo "Please verify the connection details: $username@$server_ip:/home/$username/tmp"
read "confirm?Is this correct? (yes/no): "
if [[ "$confirm" != "yes" ]]; then
  echo "Aborting."
  exit 1
fi

# Define local and remote paths
local_script_path=~/my_scripts/switch_to_zsh.sh
remote_tmp_folder="/home/$username/tmp"
remote_script_path="$remote_tmp_folder/switch_to_zsh.sh"

# Function to transfer script
transfer_script() {
  echo "Creating tmp folder on the remote server..."
  sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$username@$server_ip" "mkdir -p $remote_tmp_folder"
  echo "Transferring script to $username@$server_ip:$remote_script_path..."
  sshpass -p "$password" scp "$local_script_path" "$username@$server_ip:$remote_script_path"
}

# Function to download script from GitHub and transfer
download_and_transfer_script() {
  echo "Downloading script from GitHub..."
  curl -o /tmp/switch_to_zsh.sh https://raw.githubusercontent.com/fredrikfmjse/my_scripts/main/switch_to_zsh.sh
  echo "Creating tmp folder on the remote server..."
  sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$username@$server_ip" "mkdir -p $remote_tmp_folder"
  echo "Transferring script to $username@$server_ip:$remote_script_path..."
  sshpass -p "$password" scp /tmp/switch_to_zsh.sh "$username@$server_ip:$remote_script_path"
  rm /tmp/switch_to_zsh.sh
}

# Prompt for download or transfer
read "option?Do you want to transfer the local script or download from GitHub? (transfer/download): "
if [[ "$option" == "transfer" ]]; then
  transfer_script
elif [[ "$option" == "download" ]]; then
  download_and_transfer_script
else
  echo "Invalid option. Aborting."
  exit 1
fi

# Execute the script on the remote server
echo "Executing script on remote server..."
sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$username@$server_ip" "chmod +x $remote_script_path && $remote_script_path"

echo "Script executed successfully."

