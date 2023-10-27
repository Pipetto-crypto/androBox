#!/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
WINEPREFIX=${WINEPREFIX:-$HOME/.wine}

rm -rf $HOME/.boxconf
$PREFIX/glibc/opt/WinScripts/restart.sh
