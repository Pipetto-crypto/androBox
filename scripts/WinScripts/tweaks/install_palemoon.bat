@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\palemoon-32.5.0.win64.installer.exe"\ (

wget.exe -q https://rm-eu.palemoon.org/release/palemoon-32.5.0.win64.installer.exe -P T:\

)

start /W T:\palemoon-32.5.0.win64.installer.exe

endlocal
