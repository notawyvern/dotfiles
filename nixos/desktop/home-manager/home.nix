{ config, pkgs, ... }:

{
  home = {
    username = "crh";
    homeDirectory = "/home/crh";
  };

  imports = [ 
    /* gui and cli .nix enables (installs) packages
    and configures them in the homedir */
    ./conf.d/cli.nix 
    ./conf.d/gui.nix
    ./userpkgs.nix

    /* window manager plus
    packages for the desktop */
    ../river.nix
    ./conf.d/river-utils.nix 
  ];

  # enables home manager
  programs.home-manager.enable = true;

  # Value of configuration compatible with Home Manager. To keep
  # it avoids breakage due to changes.
  #
  # No need to change it but, if you want to, read the release notes.
  home.stateVersion = "25.05";
}
