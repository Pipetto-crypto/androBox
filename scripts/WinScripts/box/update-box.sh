#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cachedir=$HOME/.local/cache

mkdir -p $cachedir

remotebox64sha1sum="$(curl -sL https://github.com/Pipetto-crypto/box86_box64_debs/raw/master/box64/box64_$1.tar.xz | sha1sum | awk '{print $1}')"
localbox64sha1sum="$(sha1sum $cachedir/box64_$1.tar.xz)"
remotebox86sha1sum="$(curl -sL https://github.com/Pipetto-crypto/box86_box64_debs/raw/master/box86/box86_$1.tar.xz | sha1sum | awk '{print $1}')"
localbox86sha1sum="$(sha1sum $cachedir/box86_$1.tar.xz)"

if [ "$remotebox64sha1sum" != "$localbox64sha1sum" ]
then
     rm -rf $cachedir/box64_$1.tar.xz
     wget https://github.com/Pipetto-crypto/box86_box64_debs/raw/master/box64/box64_$1.tar.xz -P $cachedir
fi

if [ "$remotebox86sha1sum" != "$localbox86sha1sum" ]
then
     rm -rf $cachedir/box86_$1.tar.xz
     wget https://github.com/Pipetto-crypto/box86_box64_debs/raw/master/box86/box86_$1.tar.xz -P $cachedir
fi

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
