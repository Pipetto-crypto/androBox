#!/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
WINEPREFIX=${WINEPREFIX:-$HOME/.wine}

cat >> $HOME/.boxconf <<- EOM
BOX86_DYNAREC_FASTNAN=0
BOX86_DYNAREC_FASTROUND=0
BOX86_DYNAREC_STRONGMEM=1
BOX86_DYNAREC_WAIT=1
BOX86_DYNAREC_X87DOUBLE=1
BOX86_MUTEX_ALIGNED=0
BOX64_DYNAREC_FASTNAN=0
BOX64_DYNAREC_FASTROUND=0
BOX64_DYNAREC_STRONGMEM=1
BOX64_DYNAREC_WAIT=1
BOX64_DYNAREC_X87DOUBLE=1
BOX64_MUTEX_ALIGNED=0
EOM
$PREFIX/glibc/opt/WinScripts/restart.sh