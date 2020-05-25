# Let's run the weaveworks/ignite-ubuntu OCI image as a VM
# Use 2 vCPUs and 1GB of RAM, enable automatic SSH access and name it my-vm
sudo ignite run weaveworks/ignite-ubuntu \
    --cpus 2 \
    --memory 1GB \
    --ssh \
    --name my-vm

# List running VMs
sudo ignite ps

# List Docker (OCI) and kernel images imported into Ignite
sudo ignite images
sudo ignite kernels

# Get the boot logs of the VM
sudo ignite logs my-vm

# SSH into the VM
sudo ignite ssh my-vm

# Inside the VM you can check that the kernel version is different, and the IP address came from the container
# Also the memory is limited to what you specify, as well as the vCPUs
> uname -a
> ip addr
> free -m
> cat /proc/cpuinfo

# Rebooting the VM tells Firecracker to shut it down
> reboot

# Cleanup
sudo ignite rm my-vm
