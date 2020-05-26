#!/bin/bash

FIRECRACKER_LATEST_RELEASE=$(curl -s https://api.github.com/repos/firecracker-microvm/firecracker/releases/latest \
| grep "firecracker-v" \
| grep "x86_64" \
| grep "browser_download_url" \
| cut -d : -f 2,3 \
| tr -d \")

echo -e "\nGetting firecracker..."
echo -e "Url: ${FIRECRACKER_LATEST_RELEASE}\n"
# firecracker + jailer
[[ -e firecracker ]] || wget -q --show-progress -O firecracker $FIRECRACKER_LATEST_RELEASE
chmod +x firecracker
sleep 1

echo -e "\n\nDone!\n"
