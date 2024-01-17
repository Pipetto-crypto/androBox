@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\K-Lite_Codec_Pack_1780_Basic.exe"\ (

wget.exe -q https://files3.codecguide.com/K-Lite_Codec_Pack_1780_Basic.exe -P T:\

)

start /W T:\K-Lite_Codec_Pack_1780_Basic.exe

endlocal
