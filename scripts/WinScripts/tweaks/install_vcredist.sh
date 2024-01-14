#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cachedir=$HOME/.local/cache
mkdir -p $cachedir

[[ ! -f $cachedir/vcredist.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/vcredist.tar.xz -P $cachedir
tar -xf $cachedir/vcredist.tar.xz -C $HOME
DISPLAY=:0 openbox-session &
wine $HOME/all_vcredist.exe
kill $(pidof openbox)
