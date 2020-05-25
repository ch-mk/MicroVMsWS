#!/bin/bash


# install dependencies
apt-get update && apt-get install -y --no-install-recommends dmsetup openssh-client git binutils uuid-runtime


# install containerd if it's not present -- prevents breaking docker-ce installations
sleep 1
which containerd || apt-get install -y --no-install-recommends containerd


# download and install cni binaries
CNI_VERSION=v0.8.5
ARCH=$([ $(uname -m) = "x86_64" ] && echo amd64 || echo arm64)
sudo mkdir -p /opt/cni/bin
wget -q --show-progress -O cni.tgz https://github.com/containernetworking/plugins/releases/download/${CNI_VERSION}/cni-plugins-linux-${ARCH}-${CNI_VERSION}.tgz
sudo tar -xvzf cni.tgz -C /opt/cni/bin
sudo rm cni.tgz

# download and install ignite binaries
sleep 1
VERSION=v0.6.3
GOARCH=$(go env GOARCH 2>/dev/null || echo "amd64")

for binary in ignite ignited; do
    echo "Installing ${binary}..."
    wget -q --show-progress -O ${binary} https://github.com/weaveworks/ignite/releases/download/${VERSION}/${binary}-${GOARCH}
    chmod +x ${binary}
    sudo mv ${binary} /usr/local/bin
done

# make sure ignite installed 
ignite version
