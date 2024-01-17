@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;F:\;C:\Program Files (x86)\GnuWin32\bin


wget.exe -q https://github.com/Pipetto-crypto/androBox/releases/download/dxvk-dev/dxvk-dev.tar.xz -P T:\

cd /D T:\
F:\7zip\7z.exe x dxvk-dev.tar.xz -so | F:\7zip\7z.exe x -aoa -si -ttar -o"T:\" >NUL 2>&1
copy /Y T:\dxvk-dev\x64\*.dll C:\windows\system32 >NUL 2>&1
copy /Y T:\dxvk-dev\x32\*.dll C:\windows\syswow64 >NUL 2>&1
rmdir /Q /S "T:\dxvk-dev"
del /Q /F T:\dxvk-dev.tar.xz
pause
