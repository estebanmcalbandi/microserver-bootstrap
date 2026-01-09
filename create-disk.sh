#!/bin/bash

export DEVICE=$1
export DEVPART=${DEVICE}1
export MOUNTPOINT=./mount

sudo sfdisk ${DEVICE} < bootstrap.layout
sudo mkfs.fat -n "BOOTSTRAP" $DEVPART
echo "Disk formatted."

mkdir -p ${MOUNTPOINT}
sudo mount -o umask=000 ${DEVPART} ${MOUNTPOINT}
echo "Disk ${DEVPART} mounted in ${MOUNTPOINT}."

sudo grub-install --no-floppy --boot-directory=${MOUNTPOINT}/boot --target=i386-pc \
	--modules="zfs search_fs_uuid" ${DEVICE}
sudo cp grub.cfg ${MOUNTPOINT}/boot/grub/grub.cfg
echo "GRUB2 installed and configured."

sync
sudo umount mount
sudo rm -rf mount
echo "Done. You can now unplug the device (${DEVICE}) from USB."
