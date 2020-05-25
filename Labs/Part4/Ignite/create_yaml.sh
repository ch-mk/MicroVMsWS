#!/bin/sh


VMFILE=/etc/firecracker/manifests/smoke-test.yml

touch $VMFILE
tee "$VMFILE" > /dev/null <<EOF
apiVersion: ignite.weave.works/v1alpha2
kind: VM
metadata:
  name: smoke-test
  uid: $(uuidgen)
spec:
  image:
    oci: weaveworks/ignite-ubuntu
  cpus: 2
  diskSize: 3GB
  memory: 800MB
EOF
