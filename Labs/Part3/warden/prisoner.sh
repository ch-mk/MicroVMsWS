#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
        ./clean_all.sh
        exit;
}

echo -e "Waiting for start signal..."
./clean_all.sh
sudo ./jailer --chroot-base-dir ./jail --id 551e7604-e35c-42b3-b825-416853441234 --node 0 --exec-file ./firecracker --uid 1000 --gid 1000
sleep 1
./clean_all.sh