#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cachedir=$HOME/.local/cache

mkdir -p $cachedir

[[ ! -f $cachedir/box64_$1.tar.xz ]] && wget https://github.com/Pipetto-crypto/box86_box64_debs/raw/master/box64/box64_$1.tar.xz
[[ ! -f $cachedir/box86_$1.tar.xz ]] && https://github.com/Pipetto-crypto/box86_box64_debs/raw/master/box86/box86_$1.tar.xz

tar -xvf $cachedir/box64_$1.tar.xz -C $PREFIX/glibc/bin
tar -xvf $cachedir/box86_$1.tar.xz -C $PREFIX/glibc/bin
sleep 2
$PREFIX/glibc/opt/WinScripts/restart.sh
