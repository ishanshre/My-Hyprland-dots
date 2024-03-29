#!/bin/bash

echo "+++++Adding chaotic repo+++++"

pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "\
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist \
" >> /etc/pacman.conf

echo "+++++Finished Adding Chaotic Repo+++++"

echo "+++++Updating the system+++++"
pacman -Syu

echo "+++++Exiting+++++"
