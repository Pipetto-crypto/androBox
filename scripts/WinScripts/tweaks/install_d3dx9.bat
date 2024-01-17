@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\d3dx9.tar.xz"\ (

wget.exe -q https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/d3dx9.tar.xz -P T:\

)

if EXIST "T:\d3dx9.tar.xz"\ (

set SHA1SUMOLD=4964014cf6235a206fd35683ee87e4d958573683
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "T:\d3dx9.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F T:\d3dx9.tar.xz
wget.exe -q https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/d3dx9.tar.xz -P T:\

)

)


cd /D T:\
F:\7zip\7z.exe x d3dx9.tar.xz -so | F:\7zip\7z.exe x -aoa -si -ttar -o"T:\" >NUL 2>&1
cd d3dx9
copy /y *.dll C:\windows\syswow64
call dll_override.bat >NUL 2>&1
cd /D T:\
rmdir /Q /S T:\d3dx9

endlocal
