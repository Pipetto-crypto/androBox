#!/bin/bash

export PATH=/data/data/com.termux/files/usr/glibc/bin:/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
unset LD_PRELOAD

echo "$1" > $HOME/.locale
$PREFIX/glibc/opt/WinScripts/restart.sh
