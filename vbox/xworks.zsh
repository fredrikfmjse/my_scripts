#!/bin/zsh

# Namnet på din virtuella maskin
VM_NAME="XWorks 6.30.440"

# Namnet på nätverksinterfacet och adapternumret som orsakar problem
NETWORK_INTERFACE="enx207bd2c8acce"
ADAPTER_NUM=3

# Kontrollera om det problematiska nätverksinterfacet är anslutet på adapter 3
ATTACHED_INTERFACE=$(VBoxManage showvminfo "$VM_NAME" | grep -i "NIC $ADAPTER_NUM Rule" | grep "$NETWORK_INTERFACE")

if [[ -n "$ATTACHED_INTERFACE" ]]; then
  echo "Nätverksinterfacet '$NETWORK_INTERFACE' är anslutet på adapter $ADAPTER_NUM. Kopplar bort det..."
  VBoxManage modifyvm "$VM_NAME" --nic$ADAPTER_NUM none

  if [ $? -eq 0 ]; then
    echo "Nätverksinterfacet '$NETWORK_INTERFACE' kopplades bort framgångsrikt."
  else
    echo "Det uppstod ett fel när nätverksinterfacet skulle kopplas bort."
    exit 1
  fi
else
  echo "Nätverksinterfacet '$NETWORK_INTERFACE' är redan frånkopplat på adapter $ADAPTER_NUM."
fi

# Starta den virtuella maskinen med GUI
VBoxManage startvm "$VM_NAME" --type gui

# Kontrollera om VM startade korrekt
if [ $? -eq 0 ]; then
  echo "Den virtuella maskinen '$VM_NAME' startade korrekt."
else
  echo "Det uppstod ett fel när den virtuella maskinen '$VM_NAME' skulle startas."
fi

