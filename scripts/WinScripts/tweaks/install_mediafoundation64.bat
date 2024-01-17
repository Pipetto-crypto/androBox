@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\mediafoundation64.tar.xz"\ (

wget.exe -q https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/mediafoundation64.tar.xz -P T:\

)

if EXIST "T:\mediafoundation64.tar.xz"\ (

set SHA1SUMOLD=ee0e4883661ee25e50532c1e1fe72e4c5903e433
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "T:\mediafoundation64.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F T:\mediafoundation64.tar.xz
wget.exe -q https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/mediafoundation64.tar.xz -P T:\

)

)


cd /D T:\
F:\7zip\7z.exe x mediafoundation64.tar.xz -so | F:\7zip\7z.exe x -aoa -si -ttar -o"T:\" >NUL 2>&1
cd mediafoundation64
copy /y *.dll C:\windows\system32
call dll_override.bat >NUL 2>&1
cd /D T:\
rmdir /Q /S T:\mediafoundation64

endlocal
