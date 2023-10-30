@echo off

echo InputBridge installer v0.5 by DotNetBurst

echo Killing existing task...
taskkill /f /im ib.exe
echo Task killed
echo Installing...

copy ib Z:\usr\bin\ib
echo [ib] Installed!

copy ib.exe Z:\usr\bin\ib.exe
echo [ib.exe] Installed!

copy di.dll Z:\usr\bin\di.dll
echo [di.dll] Installed!

echo InputBridge Installed!

timeout /t 3
