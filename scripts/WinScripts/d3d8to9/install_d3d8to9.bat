@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\d3d8.dll"\ (

curl.exe -sL -O --output-dir T:\ https://github.com/crosire/d3d8to9/releases/download/v1.11.1/d3d8.dll

)

cd /D T:\
copy /y C:\windows\syswow64\d3d8.dll C:\windows\syswow64\d3d8.dll.old
copy /y d3d8.dll C:\windows\syswow64
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d8 /t REG_SZ /d native,builtin /f
