#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
        echo -e "\n** Trapped CTRL-C\n"
        
        read -p "q: Quit, s: Skip (q/s)?" CONT
        if [ "$CONT" = "q" ]; then
            echo "Quiting...";
            ./clean_all.sh
	    exit;
        fi
}

FIRECRACKER_LATEST_RELEASE=$(curl -s https://api.github.com/repos/firecracker-microvm/firecracker/releases/latest \
| grep "firecracker-v" \
| grep "x86_64" \
| grep "browser_download_url" \
| cut -d : -f 2,3 \
| tr -d \")


echo -e "\nGetting firecracker..."
echo -e "Url: ${FIRECRACKER_LATEST_RELEASE}\n"
# firecracker + jailer
[[ -e firecracker ]] || wget -q --show-progress -O firecracker "https://github.com/firecracker-microvm/firecracker/releases/download/v0.21.1/firecracker-v0.21.1-x86_64"
chmod +x firecracker
sleep 1

[[ -e images ]] || mkdir images && cd images

# alpine kernel
ALPINE_KERNEL="https://s3.amazonaws.com/spec.ccfc.min/img/minimal/kernel/vmlinux.bin"
echo -e "\nGetting alpine kernel image..."
echo -e "Url: ${ALPINE_KERNEL}\n"
[[ -e alpine-vmlinuz.bin ]] || wget -q --show-progress -O alpine-vmlinuz.bin $ALPINE_KERNEL
sleep 1

# alpine rootfs
ALPINE_ROOTFS="https://s3.amazonaws.com/spec.ccfc.min/img/minimal/fsfiles/boottime-rootfs.ext4"
echo -e "\nGetting alpine kernel image..."
echo -e "Url: ${ALPINE_ROOTfS}\n"
[[ -e alpine.ext4 ]] || wget -q --show-progress -O alpine-rootfs.ext4 $ALPINE_ROOTFS
sleep 1

cd ..


FIRECTL="https://github.com/firecracker-microvm/firectl"
echo -e "\nGetting firectl..."
echo -e "Url: ${ALPINE_ROOTfS}\n"
git clone $FIRECTL
cd firectl 
make
cd ..

echo -e "\n\nDone!\n"
