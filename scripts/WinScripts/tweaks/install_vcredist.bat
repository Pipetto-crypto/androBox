@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\vcredist.tar.xz"\ (

curl.exe -sL -O --output-dir T:\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/vcredist.tar.xz

)

if EXIST "T:\vcredist.tar.xz"\ (

set SHA1SUMOLD=41f9b41a028756537bc8799f8ab85b5296e8d23c
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "T:\vcredist.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F T:\vcredist.tar.xz
curl.exe -sL -O --output-dir T:\ https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/vcredist.tar.xz

)

)


cd /D T:\
F:\7zip\7z.exe x vcredist.tar.xz -so | F:\7zip\7z.exe x -aoa -si -ttar -o"T:\" >NUL 2>&1
start /W all_vcredist.exe
del /Q /F T:\all_vcredist.exe

endlocal
