#!/bin/bash

firectl/firectl \
--firecracker-binary=./firecracker \
--kernel=images/alpine-vmlinuz.bin \
--root-drive=images/alpine-rootfs.ext4 \
--kernel-opts="console=ttyS0 noapic reboot=k panic=1 pci=off nomodules rw"
