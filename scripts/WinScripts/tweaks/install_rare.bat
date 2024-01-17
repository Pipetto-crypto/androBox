@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "C:\Program Files\Pale Moon\palemoon.exe"\ (

start /W Z:\usr\glibc\opt\WinScripts\tweaks\install_palemoon.bat

)

if NOT EXIST "T:\Rare-1.10.11.msi"\ (

curl.exe -sL -O --output-dir T:\ https://github.com/RareDevs/Rare/releases/download/1.10.11/Rare-1.10.11.msi

)

start /W T:\Rare-1.10.11.msi

endlocal
