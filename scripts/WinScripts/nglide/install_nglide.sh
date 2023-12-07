#!/bin/sh

export PATH=/data/data/com.termux/files/usr/glibc/bin:/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
unset LD_PRELOAD

cachedir=$HOME/.local/cache
mkdir -p $cachedir
[[ ! -f $cachedir/nglide.exe ]] && curl -J -L https://www.zeus-software.com/downloads/nglide/d-1.html -o $cachedir/nglide.exe
wine $cachedir/nglide.exe
$PREFIX/glibc/opt/WinScripts/startup.sh

