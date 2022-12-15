#!/bin/sh
LFS=/mnt/lfs
SOURCES=https://www.linuxfromscratch.org/lfs/view/stable-systemd/wget-list-systemd
CHECKSUMS=https://www.linuxfromscratch.org/lfs/view/stable-systemd/md5sums
# Download input file
if ! [ -f $LFS/sources/wget-list-systemd ]; then 
    wget $SOURCES -O $LFS/sources/wget-list-systemd
else 
    echo "WARNING: Sources File already exists"
fi
# Download Md5 checksums
if ! [ -f $LFS/sources/md5sums ]; then 
    wget $CHECKSUMS -O $LFS/sources/md5sums
else 
    echo "WARNING: Checksums File already exists"
fi

# Download packages
wget --input-file=$LFS/sources/wget-list-systemd --continue --directory-prefix=$LFS/sources
#Check MD5 Checksums
pushd $LFS/sources
    md5sum -c md5sums
popd