@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;F:\;C:\Program Files (x86)\GnuWin32\bin

set wined3dver=%1

if NOT EXIST "T:\WineD3DForWindows_%wined3dver%.zip"\ (

wget.exe https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_%wined3dver%.zip -P T:\

)



cd /D T:\
mkdir T:\wined3d
F:\7zip\7z.exe x "T:\WineD3DForWindows_%wined3dver%.zip" -aoa -o"T:\wined3d"  >NUL 2>&1
del /Q /F T:\wined3d\ddraw.dll T:\wined3d\libwine.dll T:\wined3d\*.txt
copy /Y T:\wined3d\*.dll C:\windows\syswow64 
rmdir /Q /S "T:\wined3d"
