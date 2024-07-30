#!/bin/zsh

# Pinga Google för att kontrollera internetanslutning
ping -c 1 8.8.8.8 > /dev/null 2>&1

# Kontrollera exit-statusen för ping-kommandot
if [ $? -eq 0 ]; then
  echo "internet connection ok!"
else
  echo "No internet connection!"
fi

