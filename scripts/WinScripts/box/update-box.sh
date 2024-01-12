#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cachedir=$HOME/.local/cache

mkdir -p $cachedir

[[ ! -f $cachedir/box64_$1.tar.xz ]] && wget https://github.com/Pipetto-crypto/box86_box64_debs/raw/master/box64/box64_$1.tar.xz -P $cachedir
[[ ! -f $cachedir/box86_$1.tar.xz ]] && wget https://github.com/Pipetto-crypto/box86_box64_debs/raw/master/box86/box86_$1.tar.xz -P $cachedir

tar -xf $cachedir/box64_$1.tar.xz -C $PREFIX/glibc/bin
if [ -d $PREFIX/glibc/bin/x64lib ] 
then
     mkdir -p $PREFIX/glibc/lib/x86_64-linux-gnu
     cp -r $PREFIX/glibc/bin/x64lib/*  $PREFIX/glibc/lib/x86_64-linux-gnu
     rm -rf $PREFIX/glibc/bin/x64lib
fi
tar -xf $cachedir/box86_$1.tar.xz -C $PREFIX/glibc/bin
if [ -d $PREFIX/glibc/bin/x86lib ]
then
     mkdir -p $PREFIX/glibc/lib32/i386-linux-gnu
     cp -r $PREFIX/glibc/bin/x86lib/*  $PREFIX/glibc/lib32/i386-linux-gnu
     rm -rf $PREFIX/glibc/bin/x86lib
fi
sleep 2
$PREFIX/glibc/opt/WinScripts/restart.sh
