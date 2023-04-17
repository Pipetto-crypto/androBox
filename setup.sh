#!/bin/bash

echo -e "\nInstalling required dependencies"

pkg update && pkg upgrade
pkg install pulseaudio virglrenderer-android mesa xorg-server-xvfb xwayland

echo -e "\nInstalling the rootfs"

proot-distro restore ubuntu.tar.gz
wget 
chmod +x ubuntu && mv ubuntu $PREFIX/bin
