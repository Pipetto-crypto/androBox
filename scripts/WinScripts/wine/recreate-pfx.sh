#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

$PREFIX/glibc/opt/WinScripts/exit.sh

rm -rf $HOME/.wine
WINEDLLOVERRIDES="mscoree=" wine wineboot
sleep 3
pfxupdate
user="$(ls $HOME/.wine/drive_c/users | grep -e '^u')"
mkdir -p $HOME/.wine/drive_c/users/$user/AppData/Local/ProcessLasso/config
cp -r $PREFIX/glibc/opt/Programs/ProcessLasso/prolasso.ini $HOME/.wine/drive_c/users/u*/AppData/Local/ProcessLasso/config
sleep 3
$PREFIX/glibc/opt/WinScripts/restart.sh
