#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cachedir=$HOME/.local/cache
mkdir -p $cachedir

[[ ! -f $cachedir/audiofix.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/raw/androBoxNew/patches/audiofix.tar.xz -P $cachedir
tar -xf $cachedir/audiofix.tar.xz -C $cachedir
mv $cachedir/audiofix/libpulsecommon-15.99.so $PREFIX/glibc/lib32 && rm -rf $cachedir/audiofix


