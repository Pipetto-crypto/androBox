# 3in1ProotX86Emus

Exagear, box64 and box86 in the same proot rootfs. Already configured and ready to use. Pretty much a WIP, expect bugs and some broken features

# Requirments

An Android phone, Termux from F-Droid and Termux:X11 app alongside its deb installed which you can download from Termux:X11 github action page.

# Installation

Download the rootfs from link sections and move it to the root of your Internal Storage. Copy paste this command in Termux:

curl -L https://raw.githubusercontent.com/Pipetto-crypto/3in1ProotX86Emus/master/setup.sh -o setup.sh && bash setup.sh

Once installation is completed, it is highly recommended to update all the scripts in the proot with command:

ubuntu update-all

# Instructions

First you have to init the proot with:

ubuntu init

This will prompt you to install a wine version and eventually it will install InputBridge in the newly created prefix.

Additionally, you can install DXVK if you have a Turnip compatible Adreno GPU:

ubuntu install_dxvk

While it is not recommended to use this, you can optionally install Proton for Lutris:

ubuntu install_winege

When you want to launch an app, you can do it with the command:

ubuntu -x wine app.exe (for x86 apps)
ubuntu -x wine64 app.exe (for x64 and x86 apps)
ubuntu -x winege app.exe (for x64 and x86 apps with Proton for Lutris)

Eventually, you can launch a GUI that allows you to double click on the exe with one of the following:

ubuntu -x winedesktop
ubuntu -x winedesktop64
ubuntu -x winedesktopge

Using the script without any command allows to log directly inside the proot:

ubuntu

When you first use the ubuntu script, it creates a configuration file in the 3in1ProotX86Emus folder on your Internal Storage. You can modify it to change the behaviour of the command above:

For example by setting winedesktop to yes and autostart to x11, everytime you type ubuntu in command line it will automatically start WineDesktop and X11 server.

This config file can also be modified to change the default GPU renderer, although it is better you do it with ubuntu set-renderer command.

There are a lot more stuffs you can do with the ubuntu command, you can check all available commands and options with:

ubuntu help

# Known Issues

Some installers are broken in wine64 and winege for now but may be fixed in a future version

Unity apps or games will much likely not work because of the lack of udev

# Useful Proot commands

wineswitch - Allow to switch between different wine versions

update - Update all the scripts inside the proot, you will need to re-execute wineswitch and install_dxvk every time you update. Replaces old update-bins and in case you don't have this command you need to execute update-bins then update.

install_dxvk - Install DXVK in all available wineprefixes, only for Turnip compatible Adreno GPUs

remove_dxvk - Remove DXVK from all available wineprefixes

install_ib - Install InputBridge in all available wineprefixes, for both 32 and 64 bit

exawine - Run a Windows program through exagear

exawineswitch - Switch wine version for exagear

gpuswitch - Switch gpu renderer, only for box86/64. Exagear only runs on turnip+zink or dxvk for now

install_winege - Install Proton for Lutris, not recommended as it is unstable on Android

winege - Run a Windows program through Proton for Lutris

wine64 - Run a Windows x86_64 program through box64

wine - Run a Windows x86 program through box86, use -w option to run winetricks

switch_box86_stable - Switch, install and update to self compiled box86 stable builds

switch_box86_unstable - Switch and install latest box86 builds

switch_box64_stable - Switch, install and update to self compiled box64 builds

switch_box64_unstable - Switch and install latest box64 builds

winedesktop - Launch Wine Desktop for 32bit apps

winedesktop64 - Launch Wine Desktop for 32 and 64bit apps

winedesktopge - Launch Wine Desktop for Proton for Lutris

More to come in the nearby future

# Links and Credits

Termux: https://github.com/termux/termux-app

Termux-X11: https://github.com/termux/termux-x11

Box86: https://github.com/ptitSeb/box86

Box64: https://github.com/ptitSeb/box64

Mesa: https://gitlab.freedesktop.org/mesa/mesa

Alexvorxx Turnip+Zink: https://github.com/alexvorxx/mesa-zink-11.06.22

Ubuntu ROOTFS: https://drive.google.com/file/d/168psM15CwXZY6Vp8TPBt3OijtrIE9Vg1/view?usp=drivesdk

Box86 Builds: https://github.com/ryanfortner/box86-debs

Box64 Builds: https://github.com/ryanfortner/box64-debs




