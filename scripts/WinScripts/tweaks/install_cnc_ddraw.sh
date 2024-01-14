#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cachedir=$HOME/.local/cache
mkdir -p $cachedir

[[ ! -f $cachedir/cnc-ddraw.zip ]] && wget https://github.com/FunkyFr3sh/cnc-ddraw/releases/download/v6.0.0.0/cnc-ddraw.zip -P $cachedir
unzip -o $cachedir/cnc-ddraw.zip -d $HOME/.wine/drive_c/windows/syswow64

