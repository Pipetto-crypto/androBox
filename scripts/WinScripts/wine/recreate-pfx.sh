#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

$PREFIX/glibc/opt/WinScripts/exit.sh

rm -rf $HOME/.wine
wine wineboot
sleep 3
pfxupdate
sleep 4
winedesktop >/dev/null 2>&1 &
