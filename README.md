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

Init the proot with:

ubuntu init

This will install a default Wine, Wine64 and WineGE version alongside InputBridge in each one.

Type ubuntu in terminal and this will launch a 32 bit desktop instance in Termux:X11 with zink.

Everything can now be customized by using the various Start Menu entries:

## Graphics

### DXVK, D3D8to9, D8VK, WineD3D

Allow to install or remove DXVK, D8VK, WINED3D and D3D8to9. D8VK/D3D8to9 are complementary to DXVK and can be installed together, with D8VK and DXVK 2.1 and above only working on newer Wine versions. WineD3D instead replaces both of them.

### Renderer

Switch GPU renderer. Zink only works with Turnip compatible Adreno GPUs and Virgl is mostly recommended to Mali devices

## Box

Change box86 and box64 settings. Need to restart to put settings in effect

## Logging

Allow to enter or exit to/from a logging to file desktop session

## IB

Permit to install and launch InputBridge

## Switch

### Desktop

Allow to switch between 32 bit, 64 bit and GE desktop session.

### Wine

Allow to switch between some recommended Wine versions

## Menu

Reload Start menu entries

## Registry

Allow to enable/disable csmt and change video memory size

## Shutdown

Allow to restart the current session or completely shut it off

##  Launchers

Contains shortcuts to some wine utilities

Once you quit a session, you will be able to relaunch the desktop session by typing ubuntu in terminal.

This se


# Known Issues

Some installers are broken in wine64 and winege for now but may be fixed in a future version

Unity apps or games will much likely not work because of the lack of udev

Sometimes the GUI may be too big, close the file manager and relaunch the GUI by typing ubuntu in terminal

# Useful Proot commands

wineswitch - Allow to switch between different wine versions

update - Update all the scripts inside the proot, you will need to re-execute wineswitch and install_dxvk every time you update. Replaces old update-bins and in case you don't have this command you need to execute update-bins then update.

install_(dxvk|wined3d|d8vk|d3d8to9) - Install DXVK|WineD3D|D8VK|D3D8to9 in the default prefixes.

remove_(dxvk|wined3d|d8vk) - Remove  DXVK|WineD3D|D8VK|D3D8to9 from a prefix, only meant to be used from a Desktop session

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

pfxupdate - Update all existing prefixes Start Menu entries

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




