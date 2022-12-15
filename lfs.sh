#!/bin/bash
export LFS=/mnt/lfs 
export LFS_TGT=x86_64-lfs-linux-gnu 
export LFS_DISK=/dev/sdb

# check if disk is mounted
if ! grep -q "$LFS" /proc/mounts; then
    source setupdisk.sh "$LFS_DISK" 
    # inherits variables from this file
    sudo mount "${LFS_DISK}2" "$LFS"
    sudo chown -v $USER "$LFS"
fi

mkdir -pv $LFS/tools # for cross compiler
mkdir -pv $LFS/sources # for tarball source files 

# fsh file system standard
mkdir -pv $LFS/boot 
mkdir -pv $LFS/etc
mkdir -pv $LFS/bin
mkdir -pv $LFS/lib
mkdir -pv $LFS/sbin
mkdir -pv $LFS/usr 
mkdir -pv $LFS/var 

case $(uname -m) in
    x86_64) mkdir -pv $LFS/lib64 ;; #check if 64 bit
esac

# download neccessary packages
source download.sh "$LFS"

