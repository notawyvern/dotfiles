# ❄️ NixOS Config

*Anybody is free to use, modify or look into the code!*

## Overview

![Screenshot](assets/sway-desk.jpg)

Organized through the power of Home Manager, flakes, and GitHub referencing, even the wallpaper is fully declarative.

![Screenshot](assets/qutebrowser.jpg)

Personal quickmarks are declared. The [startpage](https://github.com/notawyvern/startpage) is too and refers to a repository itself. Home Manager allows deep tweaking into apps, both on CLI and GUI. Vi mode on Bash is enabled by default. And these things are just the tip of the iceberg.

## Instructions

It is **my** personal setup. Saying it isn't very opinionated would be a lie. But you still may wanna use it. So, first, open a terminal. The steps below will certainly be useful:

### Usage

```sh
git clone https://github.com/notawyvern/dotfiles.git
```

The shell script will change every instance of crh (me) to that of your current user. Later it will ask your git email and username to set them up. As such you don't have to do it manually. You can read it easily since it is well-commented.

```sh
cd ./dotfiles; ./setup.sh
```

Now just rebuild it with the "nixos" hostname and get it to test next boot!

## Questions & Answers

### Home Manager does not Build and I Get Error Codes

Probably your dotfiles are getting in the way. I suggest moving them to the .bak format for using later on. 

### Limine is Declared but is Not Installed on Rebuild. Why is that?

Make sure your system is pointing to its EFI file in order to boot. You can do so through your firmware vendor, the BIOS/UEFI, or by using [efibootmgr](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface#efibootmgr).

### How to Change the Wallpaper?

The file [sway.nix](./nixos/desktop/home-manager/sway/sway.nix) references it. You could just change the line. The built-in one checks in the ~/.wallpapers folder, which will be generated if you rebuild NixOS. It fetches my wallpaper repo from GitHub and copies some really nice images to the /nix/store. I'd suggest to take a look.

### What Keybindings should I Know?

The Windows or the Super key is used as Mod (modifier). The following keys are the most important.

- **Mod+b**: opens qutebrowser
- **Mod+d**: opens tofi menu (an app chooser alternative to dmenu)
- **Mod+t**: opens the alacritty terminal
- **Mod+q**: closes the currently focused window
- **Mod+number**: changes the workspace
- **Mod+Shift+e**: quits sway back to gtkgreet

### How to Select my Programs?

Software packages are declared in [hmpkgs](./nixos/desktop/home-manager/hmpkgs), mainly. Though also in several other places, I'd consider the rest part of a complete experience. Cherry picking them might save some bandwidth and time when rebuilding NixOS. It is a wise measure, since the deployment can be faster.

The less essential programs installed through HM in hmpkgs are the following, in the sense of a full desktop:

- FreeTube
- VSCodium
- fastfetch
- ruffle
- KolourPaint
- Spotube + ytdlp
- Upscayl
- VirtualBox

The relevant ones in the same directory are these:

- Vim
- htop
- Bash (as in Home Manager)
- git
- Qalculate!'s GTK version
- Cosmic Edit and Cosmic Files
- networkmanagerapplet
- sioyek (a pdf viewer)
- swayimg to view images
- Alacritty as a terminal emulator

You can be a minimalist and get rid of what is relevant, including by removing it elsewhere, but this is an untested route. The beauty of Linux is that you can do whatever you want. If so, you still can use some reference.

### Is it Friendly to Casual DE Users?

Mostly not. There are features lacking from a DE user standpoint. Do not expect my dotfiles to have full noob support. qutebrowser is not a typical browser nor is sioyek an easy alternative to Okular.
