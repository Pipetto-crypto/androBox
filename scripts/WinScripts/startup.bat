@echo off

start /B F:\ProcessLasso\ProcessGovernor.exe
start /B F:\7zip\7zFM.exe E:
start /B Z:\usr\glibc\opt\WinScripts\ProcessLasso.bat
findstr /c:"services=disabled" Z:\home\.androBox >nul 2>&1
if not errorlevel 1 taskkill /im services.exe /f
