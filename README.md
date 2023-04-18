# 3in1ProotX86Emus
Exagear, box64 and box86 in the same proot rootfs. Already configured and ready to use

# Requirments

An Android phone, Termux from F-Droid and Termux:X11 app alongside its deb installed which you can download from Termux:X11 github action page.

# Installation

Download the rootfs from link sections and move it to the root of your Internal Storage. Copy paste this command in Termux:

curl -L 

Once installation is completed, to access the proot you can type this command:

ubuntu or ubuntu -x in case you want to start Termux:X11 server alongside it

For non Adreno users that want to have GPU acceleration, they need to append the -va flag at the end of the second command.

To update the proot launcher script, it's possible to use the update argument:

ubuntu update


# Useful Proot commands

wineswitch - Allow to switch between different wine versions

update-bins - Update all the scripts inside the proot

install_dxvk - Install DXVK in all available wineprefixes, only for Turnip compatible Adreno GPUs

remove_dxvk - Remove DXVK from all available wineprefixes

exawine - Run a Windows program through exagear

exawineswitch - Switch wine version for exagear

gpuswitch - Switch gpu renderer, only for box86/64. Exagear only runs on turnip+zink or dxvk for now

install_winege - Install Proton for Lutris, not recommended as it is unstable on Android

winege - Run a Windows program through Proton for Lutris

wine64 - Run a Windows x86_64 program through box64

wine - Run a Windows x86 program through box86

More to come in the nearby future

# Links and Credits

Termux:

Termux-X11:

Box86:

Box64:

Mesa:

Alexvorxx Turnip+Zink:








