#!/bin/bash
#Exit immediately if a command exits with a non-zero status
set -e
#Print commands and their arguments as they are executed
set -x

yum -y update
yum -y install epel-release

#Install guest additions 6.0.10
yum -y install perl gcc dkms kernel-devel-$(uname -r) kernel-headers-$(uname -r) make bzip2
curl https://download.virtualbox.org/virtualbox/6.0.10/VBoxGuestAdditions_6.0.10.iso \
-o /tmp/vbox.iso
mkdir /tmp/VBoxGuestAdditions
mount -o loop,ro /tmp/vbox.iso /tmp/VBoxGuestAdditions
sh /tmp/VBoxGuestAdditions/VBoxLinuxAdditions.run
umount /tmp/VBoxGuestAdditions
rm -rf /tmp/*