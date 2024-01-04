#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cachedir=$HOME/.local/cache
mkdir -p $cachedir

wget https://github.com/Pipetto-crypto/androBox/releases/download/dxvk-dev/dxvk-dev.tar.xz -P $cachedir 
tar -xvf $cachedir/dxvk-dev.tar.xz -C $HOME
mv $HOME/dxvk-dev/x64/* $HOME/.wine/drive_c/windows/system32
mv $HOME/dxvk-dev/x32/* $HOME/.wine/drive_c/windows/syswow64
rm -rf $HOME/dxvk-dev $cachedir/dxvk-dev.tar.xz
