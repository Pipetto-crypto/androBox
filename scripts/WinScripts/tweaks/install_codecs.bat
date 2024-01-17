@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\K-Lite_Codec_Pack_1780_Basic.exe"\ (

curl.exe -sL -O --output-dir https://files3.codecguide.com/K-Lite_Codec_Pack_1780_Basic.exe

)

start /W T:\K-Lite_Codec_Pack_1780_Basic.exe

endlocal
