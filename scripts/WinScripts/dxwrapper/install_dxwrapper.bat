@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

echo Installing...

setlocal

set PATH=%PATH%;F:\;C:\Program Files (x86)\GnuWin32\bin

if NOT EXIST "T:\dxwrapper.zip"\ (

curl.exe -sL -O --output-dir T:\ https://github.com/elishacloud/dxwrapper/releases/download/v1.0.6542.21/dxwrapper.zip

)



cd /D T:\
mkdir T:\dxwrapper
F:\7zip\7z.exe x "T:\dxwrapper.zip" -o"T:\dxwrapper"
FOR /F "tokens=*" %%g IN ('awk.exe "/Dd7to9/{print NR}" T:\dxwrapper\dxwrapper.ini ^| head.exe -n 1') do (SET linenumber=%%g)
sed.exe -i "%linenumber%s/=.*/=1/g" T:\dxwrapper\dxwrapper.ini
copy /Y T:\dxwrapper\Stub\ddraw.dll C:\windows\syswow64
copy /Y T:\dxwrapper\dxwrapper.dll C:\windows\syswow64
copy /Y T:\dxwrapper\dxwrapper.ini C:\windows\syswow64
rmdir /Q /S "T:\dxwrapper"
