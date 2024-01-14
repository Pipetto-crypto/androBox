#!/bin/bash

if [ "$(ls $PREFIX | grep glibc)" == "glibc" ] || [ -d /sdcard/androBox ]
then
     echo -e "I have detected an already existing install. I will proceed to wipe it now".
     rm -rf $PREFIX/glibc /sdcard/androBox
fi

cleanup(){

rm -rf $HOME/glibc_prefix.tar.xz $HOME/wine-9.0-amd64.tar.xz ~/setup.sh
exit

}

install_repo_files(){

git clone --depth=1 https://github.com/Pipetto-crypto/androBox.git -b androBoxNew

for item in $HOME/androBox/scripts/*
do
   if [ ! -d $item ]
   then
        chmod +x $item && mv $item $PREFIX/bin
   else
        chmod -R 777 $item 
        cp -r $item $PREFIX/glibc/opt
   fi
done

wget https://github.com/Pipetto-crypto/androBox-extra/raw/master/programs.tar.xz -P $HOME
tar -xf $HOME/programs.tar.xz -C $HOME
mv $HOME/Programs $PREFIX/glibc/opt

mv $HOME/androBox/androBox $PREFIX/bin && chmod +x $PREFIX/bin/androBox

mkdir -p /sdcard/androBox
mv $HOME/androBox/configs/* /sdcard/androBox

}

install_glibc_pfx(){

glibc_sha1sum="2401d6bef70834d71211daf1822f215bd4709d92"
[[ ! -f $HOME/glibc_prefix.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/releases/download/glibc_prefix/glibc_prefix.tar.xz -P $HOME

if [ -f $HOME/glibc_prefix.tar.xz ]
then
     curr_glibc_sha1sum="$(sha1sum $HOME/glibc_prefix.tar.xz | awk '{print $1}')"
     if [ $curr_glibc_sha1sum == $glibc_sha1sum ]
     then
          tar -xf $HOME/glibc_prefix.tar.xz -C $PREFIX
     else
          echo -e "glibc archive sha1sum mismatch, leaving..."
          cleanup
     fi
else
     echo -e "Unable to find the glibc archive, leaving..."
     cleanup
fi

}

install_wine(){

wine_sha1sum="a94354f6f15b492b8cb6e94291ff3b2147883100"
echo -e  "\nInstalling latest wine devel"

[[ ! -f $HOME/wine-9.0-amd64.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/releases/download/wine-9.0-rc4/wine-9.0-amd64.tar.xz -P $HOME
if [ -f $HOME/wine-9.0-amd64.tar.xz ]
then
     curr_wine_sha1sum="$(sha1sum $HOME/wine-9.0-amd64.tar.xz | awk '{print $1}')"
     if [ "$curr_wine_sha1sum" == "$wine_sha1sum" ]
     then
          tar -xf $HOME/wine-9.0-amd64.tar.xz -C $PREFIX/glibc/opt
     else
          echo -e "wine archive sha1sum mismatch, leaving..."
          cleanup
     fi
else
     echo -e "Unable to find the wine archive, leaving..."
     cleanup
fi

}


do_prefix_creation(){

env BOX64_LD_LIBRARY_PATH=$PREFIX/glibc/lib/x86_64-linux-gnu \
BOX64_PATH=$PREFIX/glibc/opt/wine/bin \
LD_PRELOAD= \
WINEESYNC=0 \
BOX64_LOG=1 \
WINEDEBUG="+err" \
WINEDLLOVERRIDES="mscoree=" \
$PREFIX/glibc/bin/box64 wine64 wineboot >$HOME/wine_log.txt 2>&1
sleep 3
pfxupdate

}

echo -e "\nInstalling required dependencies"

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

install_glibc_pfx

install_wine

install_repo_files

echo "check_certificate = off" > $HOME/.wgetrc

rm -rf $HOME/androBox && rm -rf $HOME/.wine

do_prefix_creation

cleanup
