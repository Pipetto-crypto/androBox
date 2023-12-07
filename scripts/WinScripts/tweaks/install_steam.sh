#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

cachedir=$HOME/.local/cache

mkdir -p $cachedir

[[ ! -f $cachedir/SteamSetup.exe ]] && wget https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe -P $cachedir

wine $cachedir/SteamSetup.exe
$PREFIX/glibc/opt/WinScripts/tweaks/install_arial.sh
$PREFIX/glibc/opt/WinScripts/startup.sh
