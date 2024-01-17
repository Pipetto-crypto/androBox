@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\d8vk-v1.0.tar.gz"\ (

wget.exe -q https://github.com/AlpyneDreams/d8vk/releases/download/d8vk-v1.0/d8vk-v1.0.tar.gz -P T:\

)

cd /D T:\
mkdir T:\d8vk
F:\7zip\7z.exe x "T:\d8vk-v1.0.tar.gz" -so | F:\7zip\7z.exe x -aoa -si -ttar -o"T:\d8vk"
copy /y T:\d8vk\x32\d3d8.dll C:\windows\syswow64
rmdir /Q /S T:\d8vk
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d8 /t REG_SZ /d native,builtin /f
