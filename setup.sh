#!/bin/bash

echo -e "\nInstalling required dependencies"

termux-change-repo
pkg update && pkg upgrade
pkg install x11-repo -y
pkg install pulseaudio virglrenderer-android mesa xorg-server-xvfb xwayland wget proot-distro -y

if [ ! -d ~/storage ]
then
     echo -e "\nGranting internal storage permissions"
fi

mkdir -p $PREFIX/var/lib/proot-distro && mkdir -p $PREFIX/var/lib/proot-distro/installed-rootfs
if [ -f /sdcard/ubuntu.tar.gz ]
then
     echo -e "\nInstalling Ubuntu rootfs" 
     proot-distro restore /sdcard/ubuntu.tar.gz
else 
     echo -e "\nNo rootfs detected, leaving"
     exit
fi
wget https://raw.githubusercontent.com/Pipetto-crypto/3in1ProotX86Emus/master/ubuntu
chmod +x ubuntu && mv ubuntu $PREFIX/bin
