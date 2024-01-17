@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;F:\;C:\Program Files (x86)\GnuWin32\bin

set arch=%1
set type=%2
set date=%3
set revision=%4

mkdir T:\mesa\aarch64\turnip 2>NUL
mkdir T:\mesa\aarch64\zink 2>NUL
mkdir T:\mesa\armhf\turnip 2>NUL
mkdir T:\mesa\armhf\zink 2>NUL


if NOT EXIST "T:\mesa\%arch%\%type%\%type%_%date%%revision%.tar.xz"\ (

curl.exe -sL -O --output-dir T:\mesa\%arch%\%type% https://github.com/Pipetto-crypto/mesa-builds/raw/master/%arch%/%type%/%type%_%date%%revision%.tar.xz

)



cd /D T:\
if %arch%==armhf F:\7zip\7z.exe x "T:\mesa\%arch%\%type%\%type%_%date%%revision%.tar.xz" -so | F:\7zip\7z.exe x -aoa -si -ttar -o"Z:\usr\glibc\lib32" >NUL 2>&1
if %arch%==aarch64 F:\7zip\7z.exe x "T:\mesa\%arch%\%type%\%type%_%date%%revision%.tar.xz" -so | F:\7zip\7z.exe x -aoa -si -ttar -o"Z:\usr\glibc\lib" >NUL 2>&1
