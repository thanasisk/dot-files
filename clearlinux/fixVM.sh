#!/bin/sh
set -e
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
swupd bundle-add virt-manager-gui kvm-host
systemctl enable libvirtd.service
systemctl start libvirtd.service
