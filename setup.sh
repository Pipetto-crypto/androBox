#!/bin/bash

echo -e "\nInstalling required dependencies"

termux-change-repo
pkg update && pkg upgrade
pkg install x11-repo tur-repo -y
pkg install pulseaudio virglrenderer-android mesa wget fontconfig freetype libpng termux-x11-nightly cabextract zenity -y

if [ ! -d ~/storage ]
then
     echo -e "\nGranting internal storage permissions"
     termux-setup-storage
fi

if [ -f /sdcard/glibc_prefix.tar.xz ]
then
     echo -e "\nInstalling the glibc prefix" 
     tar -xvzf /sdcard/glibc_prefix.tar.xz -C $PREFIX
else 
     echo -e "\nNo glibc prefix detected, put the prefix into the root of your sdcard"
     exit
fi

if [ -f /sdcard/wine-8.14-amd64.tar.xz ]
then
     echo -e "\nInstalling patched wine"
     tar -xvf /sdcard/wine-8.14-amd64.tar.xz -C $PREFIX/opt
else
     echo -e "\nNo patched wine detected, put the patched wine into the root of your sdcard"
     exit
fi

wget https://raw.githubusercontent.com/Pipetto-crypto/androBox/master/androBox
chmod +x androBox && mv androBox $PREFIX/bin
