#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

openbox-session &
sleep 2
python3 $PREFIX/bin/Configurator.py
pkill openbox
sleep 3
$PREFIX/glibc/opt/WinScripts/restart.sh

