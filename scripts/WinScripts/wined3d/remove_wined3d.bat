@echo off

copy /y Z:\usr\glibc\opt\wine\lib\wine\i386-windows\dxgi.dll C:\windows\syswow64
copy /y Z:\usr\glibc\opt\wine\lib\wine\i386-windows\d3d9.dll C:\windows\syswow64
copy /y Z:\usr\glibc\opt\wine\lib\wine\i386-windows\d3d10core.dll C:\windows\syswow64
copy /y Z:\usr\glibc\opt\wine\lib\wine\i386-windows\d3d11.dll C:\windows\syswow64
copy /y Z:\usr\glibc\opt\wine\lib\wine\i386-windows\d3d10.dll C:\windows\syswow64
copy /y Z:\usr\glibc\opt\wine\lib\wine\i386-windows\d3d10_1.dll C:\windows\syswow64

reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v dxgi /f >NUL 2>&1 
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10 /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d11 /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d9 /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10core /f >NUL 2>&1
reg delete HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10_1 /f >NUL 2>&1
