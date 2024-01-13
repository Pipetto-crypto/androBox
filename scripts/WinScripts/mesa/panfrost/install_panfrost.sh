#!/bin/sh


panfrost_sha1sum="ea6cc3ba176c03e47524c788dd99dcfbd322a806"

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cachedir=$HOME/.local/cache
mkdir -p $cachedir

wget https://github.com/Saikatsaha1996/mesa-Panfrost-G610/releases/download/mesa-23.0.0-devel-20240109_armhf_arm64/Panfrost_G610-G710_armhf-arm64.tar.gz -P $cachedir
curr_panfrost_sha1sum="$(sha1sum $cachedir/Panfrost_G610-G710_armhf-arm64.tar.gz | awk '{print $1}'}"

if [ "$panfrost_sha1sum" == "$curr_panfrost_sha1sum" ]
then 
     tar -xzf $cachedir/Panfrost_G610-G710_armhf-arm64.tar.gz -C $PREFIX
fi


