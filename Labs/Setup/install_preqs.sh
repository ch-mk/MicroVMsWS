#!/bin/bash

echo -e "\nUpdating apt...\n"
sudo apt update

echo -e "\nInstalling net-tools...\n"
sudo apt install -y net-tools

echo -e "\nInstalling python...\n"
sudo apt install -y python

echo -e "\nInstalling curl...\n"
sudo apt install -y curl

echo -e "\nInstalling make...\n"
sudo apt install -y make

echo -e "\nInstalling build-essential...\n"
sudo apt install -y build-essential

echo -e "\nInstalling code...\n"
sudo snap install --classic code
# install C\C++ extension
# install CodeLLDB extension

echo -e "\nInstalling docker.io...\n"
sudo apt install -y docker.io

echo -e "\nExecuting setfacl kvm...\n"
sudo setfacl -m u:${USER}:rw /dev/kvm

echo -e "\nInstalling iperf3...\n"
sudo apt install -y iperf3

echo -e "\nInstalling gunplot-x11...\n"
sudo apt install -y gnuplot-x11

echo -e "\nInstalling kubectl...\n"
sudo snap install --classic kubectl 

echo -e "\nInstalling go...\n"
sudo snap install --classic go

echo -e "\nInstalling rust...\n"
curl https://sh.rustup.rs -sSf | sh

echo -e "\nPlease restart for all changes to take effect\n"
