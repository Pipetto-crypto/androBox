#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cachedir=~/.local/cache

mkdir -p $cachedir

[[ ! -f $cachedir/palemoon-32.5.0.win64.installer.exe ]] && wget https://rm-eu.palemoon.org/release/palemoon-32.5.0.win64.installer.exe -P $cachedir
wine $cachedir/palemoon-32.5.0.win64.installer.exe
