@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;F:\

set dxvkver=%1

if NOT EXIST "T:\dxvk-gplasync-v%dxvkver%.tar.gz"\ (

wget.exe -q https://gitlab.com/Ph42oN/dxvk-gplasync/-/raw/main/releases/dxvk-gplasync-v%dxvkver%.tar.gz -P T:\

)



cd /D T:\
F:\7zip\7z.exe x "T:\dxvk-gplasync-v%dxvkver%.tar.gz" -so | F:\7zip\7z.exe x -aoa -si -ttar -o"T:\" >NUL 2>&1
copy /y T:\dxvk-gplasync-v%dxvkver%\x64\*.dll C:\windows\system32
copy /y T:\dxvk-gplasync-v%dxvkver%\x32\*.dll C:\windows\syswow64
rmdir /Q /S T:\dxvk-gplasync-v%dxvkver%

