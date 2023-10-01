#!/bin/bash

[[ ! -f ~/.local/cache/K-Lite_Codec_Pack_1780_Basic.exe ]] && wget https://files3.codecguide.com/K-Lite_Codec_Pack_1780_Basic.exe -P ~/.local/cache
wine ~/.local/cache/K-Lite_Codec_Pack_1780_Basic.exe

