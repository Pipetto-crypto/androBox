@echo off

echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal


set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\arial32.exe"\ (

wget.exe -q https://github.com/pushcx/corefonts/raw/master/arial32.exe -P T:\

)

if NOT EXIST "T:\arial32b.exe"\ (

wget.exe -q https://github.com/pushcx/corefonts/raw/master/arial32b.exe -P T:\

)


cd /D T:\
mkdir T:\arial
F:\7zip\7z.exe x arial32.exe -o"T:\arial" >NUL 2>&1
F:\7zip\7z.exe x arial32b.exe -o"T:\arial" >NUL 2>&1
cd arial
copy /y *.TTF C:\windows\fonts
call :register_fonts C:\windows\fonts\Arialbd.TTF , "Arial Bold (TrueType)" >NUL 2>&1
call :register_fonts C:\windows\fonts\Arialbi.TTF , "Arial Bold Italic (TrueType)" >NUL 2>&1
call :register_fonts C:\windows\fonts\Ariali.TTF , "Arial Italic (TrueType)" >NUL 2>&1
call :register_fonts C:\windows\fonts\Arial.TTF , "Arial (TrueType)" >NUL 2>&1
call :register_fonts C:\windows\fonts\Ariblk.TTF , "Arial Black (TrueType)" >NUL 2>&1
cd /D T:\
rmdir /Q /S T:\arial

if NOT EXIST "T:\SteamSetup.exe"\ (

wget.exe -q https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe -P T:\

)

start /W T:\SteamSetup.exe

exit /B 0

:register_fonts
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion" /v Fonts /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Fonts" /v "%~2>

endlocal
