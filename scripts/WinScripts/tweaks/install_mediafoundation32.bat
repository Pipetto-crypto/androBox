@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\mediafoundation32.tar.xz"\ (

wget.exe -q https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/mediafoundation32.tar.xz -P T:\

)

if EXIST "T:\mediafoundation32.tar.xz"\ (

set SHA1SUMOLD=deb295de50e09333ab9b3e457c4f46d825fe9d07
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "T:\mediafoundation32.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F T:\mediafoundation32.tar.xz
wget.exe -q https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/mediafoundation32.tar.xz -P T:\

)

)


cd /D T:\
F:\7zip\7z.exe x mediafoundation32.tar.xz -so | F:\7zip\7z.exe x -aoa -si -ttar -o"T:\" >NUL 2>&1
cd mediafoundation32
copy /y *.dll C:\windows\syswow64
call dll_override.bat >NUL 2>&1
cd /D T:\
rmdir /Q /S T:\mediafoundation32

endlocal
