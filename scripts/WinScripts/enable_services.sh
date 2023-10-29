#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
WINEPREFIX=${WINEPREFIX:-$HOME/.wine}

kill -9 $(ps -aux | grep [s]ervices.exe | awk '{print $2}')
sed -i "4s/=.*/=enabled/g" $HOME/.androBox
wine $WIMEPREFIX/drive_c/windows/system32/services.exe &
