@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal


set PATH=%PATH%;F:\

echo Installing...

FOR %%f in (arial32, arialb32, andale32, comic32, courie32, georgi32, impact32, times32, trebuc32, verdan32, webdin32) do (

if NOT EXIST "T:\%%f.exe"\ (
curl.exe -sL -O --output-dir T:\ https://github.com/pushcx/corefonts/raw/master/%%f.exe
)

cd /D T:\
mkdir T:\%%f
F:\7zip\7z.exe x %%f.exe -o"T:\%%f" >NUL 2>&1
cd %%f
copy /y *.TTF C:\windows\fonts
cd /D T:\
rmdir /Q /S T:\%%f
)


exit /B 0

:register_fonts
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion" /v Fonts /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Fonts" /v "%~2" /t REG_SZ /d "%~1" /f

endlocal
