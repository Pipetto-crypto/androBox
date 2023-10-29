#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
WINEPREFIX=${WINEPREFIX:-$HOME/.wine}

cachedir=$HOME/.local/cache


$PREFIX/glibc/opt/WinScripts/exit.sh

case $1 in
8.0)
    [[ ! -f $cachedir/wine-$1-amd64.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/releases/download/wine-$1/wine-$1-amd64.tar.xz -P $cachedir
    ;;
8.14)
    [[ ! -f $cachedir/wine-$1-amd64.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/releases/download/wine/wine-$1-amd64.tar.xz -P $cachedir
    ;;
esac 

rm -rf $PREFIX/glibc/opt/wine
tar -xf $cachedir/wine-$1-amd64.tar.xz -C $PREFIX/glibc/opt
mv $PREFIX/glibc/opt/wine-$1-amd64 $PREFIX/glibc/opt/wine

rm -rf $HOME/.wine
wine wineboot
sleep 3
pfxupdate
sleep 4
winedesktop >/dev/null 2>&1 &   
