@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;F:\;C:\Program Files (x86)\GnuWin32\bin


curl.exe -sL -O --output-dir T:\ https://github.com/Pipetto-crypto/androBox/releases/download/dxvk-dev/dxvk-dev.tar.xz

cd /D T:\
F:\7zip\7z.exe x dxvk-dev.tar.xz -so | F:\7zip\7z.exe x -aoa -si -ttar -o"T:\" >NUL 2>&1
copy /Y T:\dxvk-dev\x64\*.dll C:\windows\system32 >NUL 2>&1
copy /Y T:\dxvk-dev\x32\*.dll C:\windows\syswow64 >NUL 2>&1
rmdir /Q /S "T:\dxvk-dev"
del /Q /F T:\dxvk-dev.tar.xz
reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v dxgi /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10core /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d11 /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d9 /t REG_SZ /d native,builtin /f >NUL 2>&1
