#!/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

[[ -z $(grep -w "checkres=enabled" $HOME/.androBox) ]] && sed -i "3s/=.*/=enabled/g" $HOME/.androBox
$PREFIX/glibc/opt/WinScripts/checkres.sh
