#!/data/data/com.termux/files/usr/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
$PREFIX/glibc/opt/WinScripts/exit.sh
sleep 3
winedesktop >/dev/null 2>&1 &
