#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
WINEPREFIX=${WINEPREFIX:-$HOME/.wine}

cachedir=$HOME/.local/cache

recreate_pfx(){

rm -rf $HOME/.wine
WINEESYNC=0 WINEDLLOVERRIDES="mscoree=" wine wineboot
sleep 3                                                                   
pfxupdate
wine Z:\\\usr\\\glibc\\\opt\\\WinScripts\\\dxvk\\\install_dxvk_dev.bat >/dev/null 2>&1
wine Z:\\\usr\\\glibc\\\opt\\\WinScripts\\\dxvk\\\install_d8vk.bat >/dev/null 2>&1
sleep 3

}

rebuild_pfx(){

WINEESYNC=0 WINEDLLOVERRIDES="mscoree=" wine wineboot -u
sleep 3                                                                   
pfxupdate
wine Z:\\\usr\\\glibc\\\opt\\\WinScripts\\\dxvk\\\install_dxvk_dev.bat >/dev/null 2>&1
wine Z:\\\usr\\\glibc\\\opt\\\WinScripts\\\dxvk\\\install_d8vk.bat >/dev/null 2>&1
sleep 3

}

$PREFIX/glibc/opt/WinScripts/exit.sh

case $1 in
8.0)
    [[ ! -f $cachedir/wine-$1-amd64.tar.xz ]] && wget -q https://github.com/Pipetto-crypto/androBox/releases/download/wine-$1/wine-$1-amd64.tar.xz -P $cachedir
    ;;
8.14)
    [[ ! -f $cachedir/wine-$1-amd64.tar.xz ]] && wget -q https://github.com/Pipetto-crypto/androBox/releases/download/wine/wine-$1-amd64.tar.xz -P $cachedir
    ;;
ge8-13)
    [[ ! -f $cachedir/wine-lutris-GE-Proton8-13-x86_64.tar.xz ]] && wget -q https://github.com/Pipetto-crypto/androBox/releases/download/wine-ge-8.13/wine-lutris-GE-Proton8-13-x86_64.tar.xz -P $cachedir
    ;;
9.0)
    [[ ! -f $cachedir/wine-$1-amd64.tar.xz ]] && wget -q https://github.com/Pipetto-crypto/androBox/releases/download/wine-$1-rc4/wine-$1-amd64.tar.xz -P $cachedir
    ;;
esac 

rm -rf $PREFIX/glibc/opt/wine
if [ "$1" == "ge8-13" ]
then
     tar -xf $cachedir/wine-lutris-GE-Proton8-13-x86_64.tar.xz -C $PREFIX/glibc/opt
     mv $PREFIX/glibc/opt/lutris* $PREFIX/glibc/opt/wine
else
     tar -xf $cachedir/wine-$1-amd64.tar.xz -C $PREFIX/glibc/opt
     mv $PREFIX/glibc/opt/wine-$1-amd64 $PREFIX/glibc/opt/wine
fi

if [ "$3" == "--no-wipe-pfx" ]
then
    rebuild_pfx
else
    recreate_pfx
fi


if [ "$2" == "--cli" ]
then
     exit
else
     $PREFIX/glibc/opt/WinScripts/restart.sh
fi
