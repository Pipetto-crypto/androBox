@echo off

echo Removing...
copy /y Z:\usr\glibc\opt\wine\lib\wine\i386-windows\d3d8.dll C:\windows\syswow64
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d8 /f

