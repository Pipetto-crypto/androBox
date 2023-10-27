#!/bin/bash

echo -e "\nInstalling required dependencies"

termux-change-repo
pkg update && pkg upgrade -y
pkg install x11-repo tur-repo -y
pkg install pulseaudio git virglrenderer-android mesa wget fontconfig freetype libpng termux-x11-nightly cabextract zenity openbox file xorg-xrandr xterm -y 

if [ ! -d ~/storage ]
then
     echo -e "\nGranting internal storage permissions"
     termux-setup-storage
fi

if [ -f /sdcard/glibc_prefix.tar.xz ]
then
     echo -e "\nInstalling the glibc prefix" 
     tar -xvf /sdcard/glibc_prefix.tar.xz -C $PREFIX
else 
     echo -e "\nNo glibc prefix detected, put the prefix into the root of your sdcard"
     exit
fi

echo -e "
1.Wine 8.0 Stable
2.Wine 8.14 Devel
"
read -p "Select a wine version to install:" installchoice

case $installchoice in
1) 
    wget https://github.com/Pipetto-crypto/androBox/releases/download/wine-8.0/wine-8.0-amd64.tar.xz -P /sdcard
    tar -xvf /sdcard/wine-8.0-amd64.tar.xz -C $PREFIX/glibc/opt
    ;;
2)
    wget https://github.com/Pipetto-crypto/androBox/releases/download/wine/wine-8.14-amd64.tar.xz -P 
    tar -xvf /sdcard/wine-8.0-amd64.tar.xz -C $PREFIX/glibc/opt
    ;;
esac

mv $PREFIX/glibc/opt/wine-*-amd64 $PREFIX/glibc/opt/wine

for item in $HOME/androBox/scripts/*
do
   [[ ! -d $item ]] && chmod +x $item && mv $item $PREFIX/bin
done

mkdir -p /sdcard/androBox
mv $HOME/androBox/configs/* /sdcard/androBox

echo "check_certificate = off" > $HOME/.wgetrc

rm -rf $HOME/androBox
wine wineboot
pfxupdate

cat >> $HOME/.androBox <<- EOM
#androBox configuration file

checkres=enabled
services=disabled
EOM
