@echo off
echo Attempting to start service ...
net start ProcessGovernor >> nul 2>&1
if %ERRORLEVEL% == 0 goto ServiceOK
echo Launching process ...
start ProcessGovernor.exe /manual
:ServiceOK