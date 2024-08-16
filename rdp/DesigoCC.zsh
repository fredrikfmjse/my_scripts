#!/bin/zsh
#
 echo "Starting Desigo CC RDP..."


# Start Remmina with the specific profile
nohup remmina -c ~/.local/share/remmina/fmj_rdp_desigo-cc_172-16-21-25.remmina > /dev/null 2>&1 &

