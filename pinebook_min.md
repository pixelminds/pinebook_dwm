# A keyboard-centric workflow with PineBook Pro

This adventure started with a very simple idea: the need of a silent, fanless, minimalist laptop. Living with others comes with this kind of requirements. Otherwise I would probably be writing this on a bulky workstation with a clicky, noisy mechanical keyboard.

## Which laptop: unexpectedly cheap

The first thing to figure out was where to put the money, and how much. Several months were invested in comparing laptops, learning about how some CPUs get so hot, you can't really expect to use them fanless. Then I started comparing prices, and figured out I would need to spend over a thousand bucks. Suddenly I found some videos about the PineBook Pro. That moment was eye-opening. Yes, of course, I know I won't be able to render 3D scenes or videos, but the purpose of this machine is to write, probably browse, and check emails. That's it. So I then started looking for the bad news, people unhappy with this laptop. Most negative posts were about the dim screen, which is OK to me, since I was going to use it mainly inside, and most of the times at night. But the excitement of finding my perfect match was multiplied as soon as I had it in my hands. It's so slick, black, light and silent, I just love it.

## Which distro: trying the wild side

This last version of the PineBook Pro comes bundled with Manjaro KDE (ARM version). The original idea of getting a laptop for writing away from my desk was to get rid of the mouse. Trackpads in general are bad for serious work, and make you less productive. A keyboard-centric workflow became one of my research topics. Before I decided to order the laptop, I got interested in tiling window managers. I listened to videos by the coolest nerds out there, and read comparisons about keyboard workflows, minimalist setups, and all this bunch of dotfile collectors. Well, I've become one of those.

Once I had the laptop ordered, and while it was shipped, I made some tweaking on my old noisy i386 laptop to test the tools. I had AntiX installed, which included HerbstluftWM. I had the feeling it would be as hard as I expected. In fact, I'm really writing this three months later than that, as soon as I have set up the whole workflow. I kept testing the keybindings and the logic behind the window manager. I also tried to install i3, which was so easy to configure, but I sort of felt the radical minimalism was still somewhere else. I tried to install dwm from the package manager, but it needed some ricing, which needed you to build from source. This meant installing a bunch of developer stuff I didn't expect --thus bloating my system. I also tried to use bspwm, and what else. After some days of frustration I decided to try the suckless path, installing dwm, slstatus, dmenu, and the st terminal from source. Boy, that felt good, I had found exactly what I wanted.

As soon as I got hold of my PineBook, probably the first thing to try was getting rid of KDE. I first had the thought of trying sway, since there was a Manjaro ARM distro based on sway. It really looked good, and worked exactly like i3. Wayland has some charm in it, but I found some pieces of software working awkwardly or simply not working. The simple idea of stepping back, and installing X11 while the whole KDE environment was still there made me feel like I was messing up a bloated system. I uninstalled KDE, and suddenly I lost connection to the Internet. I had to google for basic installation and configuration procedures. At this point I decided to make a fresh install of a minimal system, and then build up my keyboard-centric workflow based on a tiling window manager. Since the only officially supported WM was sway, I decided to move ahead and install the dwm ecosystem.

In order to switch distros, I needed to start up from the SD card, and I had a hard time to find why I couldn't. After several trial and error attempts, I found out that Armbian would start up from SD, and I used that to install Manjaro minimal to the eMMC module. Why Manjaro? Well, I've been using Manjaro for years, and simply find it one of the best distros out there. Besides this, the PineBook kernel is made by Manjaro, so I feel I will get better integration to the hardware components out of the box.

I've finally reached the sweet spot of my desired workflow: a tiling window manager as a framework to write on vim, with git version management, mkdocs as static site generator, and thunderbird with all mailboxes on a network server. I've found some trouble on every single step of this journey, but that's okay as long as you can find the solution, and this is why I decided to share it. All this trouble finally will make sense if just anyone in the same situation can take advantage of my research.

So let's get in detail. For each problem found I wrote down step-by-step notes, with the idea of replicating if ever needed.
 
## Wireless configuration: connecting to the world

```
$ lsblk -f \\ identify ROOT partition, probably mmcblk2p2
# mkdir -p /mnt
# mount -o rw /dev/mmcblk2p2
```

## Which software: less is more
