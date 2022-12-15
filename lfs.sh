#!/bin/bash
export LFS=/mnt/lfs 
export LFS_TGT=x86_64-lfs-linux-gnu 
export LFS_DISK =/dev/sdb

# check if disk is mounted
if ! grep -q "$LFS" /proc/mounts; then
    source setupdisk.sh "$LFS_DISK" 
    # inherits variables from this file
    sudo mount "${LFS_DISK}2" "$LFS"
    sudo chown -v $USER "$LFS"
fi
