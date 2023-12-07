#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cachedir=$HOME/.local/cache
mkdir -p $cachedir

[[ ! -f $cachedir/Rare-1.10.3.msi ]] && wget https://github.com/Dummerle/Rare/releases/download/1.10.3/Rare-1.10.3.msi -P $cachedir
wine $cachedir/Rare-1.10.3.msi
$PREFIX/glibc/opt/WinScripts/startup.sh
