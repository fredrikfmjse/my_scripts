#!/bin/bash

#List of websites to ping
WEBSITES=("8.8.8.8" "1.1.1.1" "github.com")

#Initialize a variable to track network status
NETWORK_STATUS=0

#Ping Google to check network status
echo "Checking network status..."

for WEBSITE in "${WEBSITES[0]}"; do
	if ping -c 4 $WEBSITE &> /dev/null; then
		NETWORK_STATUS=1
		break
	fi
	done

if [ $NETWORK_STATUS -eq 1 ]; then
	echo "Network is up!"
else
	echo "Network is down!"
fi
