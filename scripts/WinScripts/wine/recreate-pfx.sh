#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

$PREFIX/glibc/opt/WinScripts/exit.sh

rm -rf $HOME/.wine
WINEESYNC=0 WINEDLLOVERRIDES="mscoree=" wine wineboot
sleep 3
pfxupdate
wine Z:\\\usr\\\glibc\\\opt\\\WinScripts\\\dxvk\\\install_dxvk_dev.bat >/dev/null 2>&1
wine Z:\\\usr\\\glibc\\\opt\\\WinScripts\\\dxvk\\\install_d8vk.bat >/dev/null 2>&1
sleep 3
$PREFIX/glibc/opt/WinScripts/restart.sh
