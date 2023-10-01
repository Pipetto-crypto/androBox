#!/bin/bash

echo -e "\nInstalling required dependencies"

termux-change-repo
pkg update && pkg upgrade
pkg install x11-repo -y
pkg install pulseaudio virglrenderer-android mesa wget proot-distro -y

if [ ! -d ~/storage ]
then
     echo -e "\nGranting internal storage permissions"
fi

mkdir -p $PREFIX/var/lib/androBox
if [ -f /sdcard/ubuntu.tar.gz ]
then
     echo -e "\nInstalling Ubuntu rootfs" 
     tar -xvzf /sdcard/ubuntu.tar.gz -C $PREFIX/var/lib/androBox
else 
     echo -e "\nNo rootfs detected, leaving"
     exit
fi

wget https://raw.githubusercontent.com/Pipetto-crypto/androBox/master/androBox
chmod +x androBox && mv androBox $PREFIX/bin
