chmod 400 xenial.rootfs.id_rsa

ID="2"
# get the IP for that microVM
ifconfig fc-$ID-tap0 | grep "inet "
       inet 169.254.0.170  netmask 255.255.255.252  broadcast 0.0.0.0

# IP of microVM on other side is *one less*
ssh -i xenial.rootfs.id_rsa root@169.254.0.169
