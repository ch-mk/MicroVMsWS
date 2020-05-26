#!/bin/bash

sudo apt install -y net-tools

sudo apt install -y python

sudo apt install -y curl

sudo apt install -y make

sudo apt install -y build-essential

sudo snap install --classic code
# install C\C++ extension
# install CodeLLDB extension

sudo apt install -y docker.io

sudo setfacl -m u:${USER}:rw /dev/kvm

sudo apt install -y iperf3

sudo apt install -y gnuplot-x11

sudo snap install --classic kubectl 

sudo snap install --classic  go

curl https://sh.rustup.rs -sSf | sh

echo -e "\nPlease restart for all changes to take effect\n"
