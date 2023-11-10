#!/bin/bash

if [ "$(ls $PREFIX | grep glibc)" == "glibc" ]
then
     echo -e "I have detected an already existing install. I will proceed to wipe it now".
     rm -rf /sdcard/glibc_prefix.tar.xz
     rm -rf /sdcard/wine-8.0-amd64.tar.xz
     rm -rf /sdcard/wine-8.14-amd64.tar.xz
     rm -rf $PREFIX/glibc
fi


echo -e "\nInstalling required dependencies"

termux-change-repo
pkg upgrade -y
pkg install x11-repo tur-repo -y
pkg install pulseaudio git virglrenderer-android mesa wget fontconfig freetype libpng termux-x11-nightly cabextract zenity openbox file xorg-xrandr xterm iconv termux-exec nnn -y 

if [ ! -d ~/storage ]
then
     echo -e "\nGranting internal storage permissions"
     termux-setup-storage
     sleep 25
fi

if [ ! -d ~/storage ]
then
     echo -e "\nStorage is still not set, I will retry again"
     termux-setup-storage
     sleep 25
fi

if [ ! -d ~/storage ]
then
     echo -e "I couldn't setup storage, I will leave now"
     exit
fi

if [ -d ~/storage ]
then
     touch /sdcard/tmp.txt
     [[ ! -f /sdcard/tmp.txt ]] && echo -e "Seems like storage permissions are not set properly. I can't do anything else, set them manually and retry" && exit
     rm -rf /sdcard/tmp.txt
fi

[[ ! -f /sdcard/glibc_prefix.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/releases/download/glibc_prefix/glibc_prefix.tar.xz -P /sdcard

if [ -f /sdcard/glibc_prefix.tar.xz ]
then
     tar -xf /sdcard/glibc_prefix.tar.xz -C $PREFIX
else
     echo -e "It seems that the glibc prefix didn't download properly, exiting now. Please make sure you have a good internet connection and retry"
     exit
fi

echo -e "
1.Wine 8.0 Stable(Adreno 7xx users recommended)
2.Wine 8.14 Devel
"
read -p "Select a wine version to install:" installchoice

case $installchoice in
1) 
    [[ ! -f /sdcard/wine-8.0-amd64.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/releases/download/wine-8.0/wine-8.0-amd64.tar.xz -P /sdcard
    tar -xf /sdcard/wine-8.0-amd64.tar.xz -C $PREFIX/glibc/opt
    ;;
2)
    [[ ! -f /sdcard/wine-8.14-amd64.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/releases/download/wine/wine-8.14-amd64.tar.xz -P /sdcard
    tar -xf /sdcard/wine-8.14-amd64.tar.xz -C $PREFIX/glibc/opt
    ;;
esac

mv $PREFIX/glibc/opt/wine-*-amd64 $PREFIX/glibc/opt/wine

git clone https://github.com/Pipetto-crypto/androBox.git -b androBoxNew

for item in $HOME/androBox/scripts/*
do
   if [ ! -d $item ]
   then
        chmod +x $item && mv $item $PREFIX/bin
   else
        cp -r $item  $PREFIX/glibc/opt
   fi
done

mv $HOME/androBox/androBox $PATH && chmod +x $PATH/androBox

mkdir -p /sdcard/androBox
mv $HOME/androBox/configs/* /sdcard/androBox

echo "check_certificate = off" > $HOME/.wgetrc

apply_patch

rm -rf $HOME/androBox && rm -rf $HOME/.wine
wine wineboot
sleep 3
pfxupdate

cat > $HOME/.androBox <<- EOM
#androBox configuration file

checkres=enabled
services=enabled
EOM
 
rm -rf ~/setup.sh
