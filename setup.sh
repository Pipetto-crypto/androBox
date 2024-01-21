#!/bin/bash



clean_old_files(){

if [ "$(ls $PREFIX | grep glibc)" == "glibc" ] || [ -d /sdcard/androBox ]
then
     echo -e "I have detected an already existing install. I will proceed to wipe it now".
     rm -rf $PREFIX/glibc /sdcard/androBox
fi

}

cleanup(){

echo -e "\nSetup complete, to enter type androBox in terminal. Cleaning stale files up..."
rm -rf $HOME/glibc_prefix.tar.xz $HOME/wine-9.0-amd64.tar.xz ~/setup.sh
exit

}

log_to_file(){

clear

TERMINAL_LOGFILE=${HOME}/setup_log.txt

echo -e "\nThis initial part of the setup will be logged inside ${TERMINAL_LOGFILE}"

exec 3>&1 4>&2
exec 1>$TERMINAL_LOGFILE 2>&1

}

stop_logging(){

exec >&3 2>&4

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
rm -rf $HOME/Programs && tar -xf $HOME/programs.tar.xz -C $HOME
rm -rf $PREFIX/glibc/opt/Programs && mv $HOME/Programs $PREFIX/glibc/opt

mv $HOME/androBox/androBox $PREFIX/bin && chmod +x $PREFIX/bin/androBox

mkdir -p /sdcard/androBox
mv $HOME/androBox/configs/* /sdcard/androBox

echo "check_certificate = off" > $HOME/.wgetrc

rm -rf $HOME/androBox
rm -rf $HOME/programs.tar.xz

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

wine_command(){

env BOX64_LD_LIBRARY_PATH=$PREFIX/glibc/lib/x86_64-linux-gnu \
BOX64_PATH=$PREFIX/glibc/opt/wine/bin \
LD_PRELOAD= \
WINEESYNC=0 \
BOX64_LOG=1 \
WINEDEBUG="+err" \
WINEDLLOVERRIDES="mscoree=" \
$PREFIX/glibc/bin/box64 wine64 "$@"

}

do_prefix_creation(){

rm -rf $HOME/.wine

WINE_LOGFILE="${HOME}/wine_log.txt"

echo -e "\nPrefix setup will be logged to ${WINE_LOGFILE}"
wine_command wineboot >${WINE_LOGFILE} 2>&1
sleep 3
pfxupdate
wine_command /data/data/com.termux/files/usr/glibc/opt/WinScripts/dxvk/install_dxvk_dev.bat  >>${WINE_LOGFILE} 2>&1
wine_command /data/data/com.termux/files/usr/glibc/opt/WinScripts/d8vk/install_d8vk.bat >>${WINE_LOGFILE} 2>&1

}

check_storage_permission() {

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

}

install_packages(){


echo -e "\nInstalling required dependencies"

pkg upgrade -y
pkg install x11-repo tur-repo -y
pkg install pulseaudio git virglrenderer-android mesa wget fontconfig freetype libpng termux-x11-nightly cabextract zenity openbox file xorg-xrandr xterm iconv termux-exec nnn -y

}

check_storage_permission

log_to_file

clean_old_files

install_packages

install_glibc_pfx

install_wine

install_repo_files

stop_logging

do_prefix_creation

cleanup
