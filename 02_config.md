# A keyboard-centric workflow with PineBook Pro

## Basic configuration, a step by step guide

### Wireless configuration

Some system installers include a step for wireless configuration, but when this is not the case, you'll need to configure it. Most distros rely on Network Manager, which can be configured using nmtui. Manjaro uses iNet Wireless Daemon (iwd). You can find a brief guide in the [Manjaro forum](https://forum.manjaro.org/t/guide-install-manjaro-arm-minimal-headless-on-rpi4-with-wifi/96515). I'm copying all the commands needed in this guide. Do not type the $ and # symbols, they just show when you need to use sudo or su privileges (lines starting with #), and when not (lines with $).

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

### Trackpad refinement

As I already said, trackpads are far from being a mouse replacement, but you can make it sweeter by adding tap-to-click functionality. There are a number of sites explaining how to do it, like [this one](https://www.rockyourcode.com/get-your-touchpad-working-on-manjaro-i3/). You just need to build a config file named `30-touchpad.conf`,containing the following code, and place it in `/etc/X11/xorg.conf.d/`. 
```
Section "InputClass"
   Identifier "touchpad"
   Driver "libinput"
   Match IsTouchpad "on"
   Option "Tapping" "on"
   Option "Scroll-method" "edge"
End Section
```
### Window management 

One of the key decisions about configuring a new system is what kind of desktop experience we expect. There's multiple side-effects around this decision -- installation can be straight forward, or it might need several smaller steps; components can be part of the core environment, or you can choose them separately; but there's two significant details that broght myself to this specific setup: keeping bloat to minimal, and avoiding the need of a mouse. Trackpad is there to help, but you should be able to work without it, and manager to do everything just with your keyboard. A tiling window manager is one of the shortest paths to a keyboard-centric environment, and they are generally as small and dry as can be.
After trying a number of tiling window managers, I ended up prefering dwm. First I tried the binary install from pacman, but dwm needs recompiling to achieve any ricing or config tweaks, so it eventually turns out to be not the driest option out there. You need to install the development tools so you can compile from source. At this point you may decide to give i3 a try, or any other option that you can rice by simply editing a config file. I did. But I went back to dwm, simply because I liked it better, and actually compiling is sort of fun.
On other distros, installing the development setup can be somehow complicated. On Manjaro (or any Arch derivative) you just do `# pacman -S base-devel`.
After this installation, you can go ahead and download the dwm sources, and do the first compilation:
```
$ git clone git://git.suckless.org/dwm
$ cd dwm
$ make
# make clean install

```
Once in the task of compiling dwm, the same exact process can be done with the other suckless applications, like dmenu, st, and slstatus. A lot can be said about the suckless philosophy. Basically what they offer is just what many Linux users expect in a Linux-based workflow - each application has a purpose, performs efficiently, and it doesn't try to do anything else. After some time using Linux, you get used to this philosophy, to the point that you might prefer something like khard for your contact management, just because it's the closest to nothing, and it gets the job perfectly done.

### File management

File management is a core function in any operating system. Linux comes bundled with all the functions you need to create, move, copy, and navigate directories and files. But most of us expect a little more than a text listing to move things around. There's different approaches to this: the graphical window approach of conventional desktop environments, the dual pane listing, or the multiple level navigation (known as Miller lists). When you've chosen the terminal as your working place, then ranger is one of the most vim-like file managers. There's a faster fork called lf, written in go, but the user experience with ranger is closer to my preference. Installing ranger has no secret, you can use your regular package manager. Configuring is done in several config files, one for the bindings, one for the helper apps.

### Extra software: less is more

Besides the file manager, there's usually a few other apps that you'll need to make your stuff. In my case I just want to write stuff, keep track of versions, and probably set it up for publishing. Email is a basic means of sharing, so we'll put that on the list, too. I also want to make sure there's a backup of important files, and of course I'd like to make sure I don't have to start all this over, so system backup or snapshots are needed too.

