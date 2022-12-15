#!/bin/sh
LFS_DISK="$1" # get cli arg 1

sudo fdisk "$LFS_DISK" << EOF
o
n
p
1

+100M
a
n
p
2


p
w
q
EOF

sudo mkfs -t ext2 -f "${LFS_DISK}1"
sudo mkfs -t ext2 -f "${LFS_DISK}2"