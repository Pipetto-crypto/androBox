@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;F:\;C:\Program Files (x86)\GnuWin32\bin

set dxvkver=%1

if NOT EXIST "T:\dxvk-%dxvkver%.tar.gz"\ (

wget.exe -q https://github.com/doitsujin/dxvk/releases/download/v%dxvkver%/dxvk-%dxvkver%.tar.gz -P T:\

)



cd /D T:\
F:\7zip\7z.exe x "T:\dxvk-%dxvkver%.tar.gz" -so | F:\7zip\7z.exe x -aoa -si -ttar -o"T:\" >NUL 2>&1
copy /Y T:\dxvk-%dxvkver%\x64\*.dll C:\windows\system32 >NUL 2>&1
copy /Y T:\dxvk-%dxvkver%\x32\*.dll C:\windows\syswow64 >NUL 2>&1
rmdir /Q /S "T:\dxvk-%dxvkver%"
