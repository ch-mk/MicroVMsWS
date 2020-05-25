#!/bin/bash


JAIL_DIR="./jail/firecracker/551e7604-e35c-42b3-b825-416853441234/root"

FC_SOCK_NAME="firecracker.socket"
FC_SOCK=$JAIL_DIR/run/$FC_SOCK_NAME

KERNEL="alpine-vmlinuz.bin"
ROOTFS="alpine-rootfs.ext4"

cp "images/$KERNEL" $JAIL_DIR
cp "images/$ROOTFS" $JAIL_DIR


curl --unix-socket $FC_SOCK -i \
        -X PUT 'http://localhost/boot-source'   \
        -H 'Accept: application/json'           \
        -H 'Content-Type: application/json'     \
        -d "{
              \"kernel_image_path\": \"${KERNEL}\",
              \"boot_args\": \"console=ttyS0 reboot=k panic=1 pci=off\"
         }"



sleep 1 
curl --unix-socket $FC_SOCK -i \
    -X PUT 'http://localhost/drives/rootfs' \
    -H 'Accept: application/json'           \
    -H 'Content-Type: application/json'     \
    -d "{
          \"drive_id\": \"rootfs\",
          \"path_on_host\": \"${ROOTFS}\",
          \"is_root_device\": true,
          \"is_read_only\": false
     }"


sleep 1 
curl --unix-socket $FC_SOCK -i \
    -X PUT 'http://localhost/actions'       \
    -H  'Accept: application/json'          \
    -H  'Content-Type: application/json'    \
    -d '{
        "action_type": "InstanceStart"
     }'

echo -e "\nDone!\n"