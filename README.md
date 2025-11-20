## Easy and Breezy

![Screenshot](assets/sway-desk.jpg)

Organized through the power of Home Manager, flakes, and GitHub referencing. Even the wallpaper is fully declarative.

## Customized Qutebrowser

![Screenshot](assets/qutebrowser.jpg)

My personal quickmarks, custom tweaks and all. Even the Homepage is declared by referencing a repository I forked! Simple and neat!

## Usage and Trying

It is **my** personal setup. Saying it isn't very opinionated would be a lie. But you still may wanna use it. So first open a terminal. The steps below will probably be useful:

### Instructions

```sh
git clone https://github.com/notawyvern/dotfiles.git
```

You may edit files inside it with a text editor eg. vim to cherry pick the apps you want, which saves bandwitch. Then return to the previous directory.

```sh
cd ./dotfiles/nixos/desktop/home-manager/hmpkgs
cd -
```

Changes all "crh" (me) instances with your current username. May fail, rarely, since flake or repositories' hash sums can share the string. Here if you don't wanna do it manually.

```sh
find ./dotfiles/nixos -type f -exec sed -i "s/crh/"$(whoami)"/g" {} +
```

Now just rebuild it with the nixos hostname and get it to test next boot!

## Copy Parts or Wholes (respecting the license, ofc)!

It is Open Source. Programmers are not like artists. We don't feel stolen when our code is taken, but affirmed. It is probably obvious to the reader (that's you) since it's GitHub.
