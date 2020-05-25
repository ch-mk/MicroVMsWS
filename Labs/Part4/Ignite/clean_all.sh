#!/bin/bash


# force-remove all running VMs
ignite rm -f $(ignite ps -aq)

# remove the data directory
rm -r /var/lib/firecracker

# remove the ignite and ignited binaries
rm /usr/local/bin/ignite{,d}

# remove 
rm -r /opt/cni
