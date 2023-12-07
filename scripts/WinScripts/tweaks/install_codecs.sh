#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

[[ ! -f ~/.local/cache/K-Lite_Codec_Pack_1780_Basic.exe ]] && wget https://files3.codecguide.com/K-Lite_Codec_Pack_1780_Basic.exe -P ~/.local/cache
wine ~/.local/cache/K-Lite_Codec_Pack_1780_Basic.exe
$PREFIX/glibc/opt/WinScripts/startup.sh
