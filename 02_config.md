# A keyboard-centric workflow with PineBook Pro

## Basic configuration, a step by step guide

### Wireless configuration: connecting to the world

Some system installers include a step for wireless configuration, but when this is not the case, you'll need to configure it. Most distros rely on Network Manager, which can be configured using nmtui. Manjaro uses iNet Wireless Daemon (iwd). You can find a brief guide in the [https://forum.manjaro.org/t/guide-install-manjaro-arm-minimal-headless-on-rpi4-with-wifi/96515][Manjaro forum]. I'm copying all the commands needed in this guide. Do not type the $ and # symbols, they just show when you need to use sudo or su privileges (lines starting with #), and when not (lines with $).

+ We'll first try to figure out which is the ROOT partition, probably mmcblk2p2.
```
$ lsblk -f
```
+ Then we'll manually build the iwd config file. Replace `wifi-name` with the UUID of your wifi network, and `pwd` with the corresponding passphrase.
```
# mkdir -p /mnt
# mount -o rw /dev/mmcblk2p2 /mnt
# mkdir -p /mnt/var/lib/iwd
# touch /mnt/var/lib/iwd/wifi-name.psk
# echo "[Security]" | sudo tee -a /mnt/var/lib/iwd/wifi-name.psk
# echo "Passphrase=pwd" | sudo tee -a /mnt/var/lib/iwd/wifi-name.psk
# umount /mnt
# reboot
```
+ After reboot you should have connection to Internet. One way to check if you're connectied is to try upgrading Linux.
```
# pacman -Syu
```

### Trackpad refinement: tapping and scrolling

As I already said, trackpads are far from being a mouse replacement, but you can make it sweeter by adding tap-to-click functionality. There are a number of sites explaining how to do it, like [https://www.rockyourcode.com/get-your-touchpad-working-on-manjaro-i3/][this one]. You just need to build a config file named `30-touchpad.conf`,containing the following code, and place it in `/etc/X11/xorg.conf.d/`. 
```
Section "InputClass"
   Identifier "touchpad"
   Driver "libinput"
   Match IsTouchpad "on"
   Option "Tapping" "on"
   Option "Scroll-method" "edge"
End Section
```
### Window managementut 

One of the key decisions about configuring a new system is what kind of desktop experience we expect. There's multiple side-effects around this decision -- installation can be straight forward, or it might need several smaller steps; components can be part of the core environment, or you can choose them separately; but there's two significant details that broght myself to this specific setup: keep bloat to minimal, and avoid the mouse. Trackpad is there to help, but you should be able to work without it, just with your keyboard. A tiling window manager is one of the shortest paths to a keyboard-centric environment, and they are generally small.
After trying a number of tiling window managers, I ended up prefering dwm. First I tried the binary install from pacman, but dwm need recompiling to achieve any ricing or config tweaks, so it eventually turns out to be not the driest option out there. You need to install the development tools so you can compile from source. At this point you may decide to give i3 a try, or any other option that you can rice by simply editing a config file. I did. But I went back to dwm, simply because I liked it better, and actually compiling is sort of fun.
On other distros, installing the development setup can be somehow complicated. On Manjaro (or any Arch derivative) you just do `# pacman -S base-devel`.
After this installation, you can go ahead and download the dwm sources, and do the first compilation:
```
$ git clone git://git.suckless.org/dwm
$ cd dwm
$ make
# make clean install

```
### File management

### Extra software: less is more
