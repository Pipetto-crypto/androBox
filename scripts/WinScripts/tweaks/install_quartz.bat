@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\quartz.tar.xz"\ (

wget.exe -q https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/quartz.tar.xz -P T:\

)

if EXIST "T:\quartz.tar.xz"\ (

set SHA1SUMOLD=5af7f1e1b73ef6928c6dfe9f442f6d966984ddc9
FOR /F "tokens=*" %%g IN ('sha1sum.exe  "T:\quartz.tar.xz" ^| awk.exe  "{print $1}"') do (SET SHA1SUMNEW=%%g)


if NOT !SHA1SUMOLD! == !SHA1SUMNEW! (

del /Q /F T:\quartz.tar.xz
wget.exe -q https://github.com/Pipetto-crypto/androBox-extra/raw/master/tweaks/quartz.tar.xz -P T:\

)

)


cd /D T:\
F:\7zip\7z.exe x quartz.tar.xz -so | F:\7zip\7z.exe x -aoa -si -ttar -o"T:\" >NUL 2>&1
copy /y quartz.dll C:\windows\syswow64
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v quartz /t REG_SZ /d native,builtin /f >NUL 2>&1
del /Q /F quartz.dll

endlocal
