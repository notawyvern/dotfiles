{ config, pkgs, ... }:

{
  home = {
    username = "crh";
    homeDirectory = "/home/crh";
  };

  imports = [ 
    ./cmdline.nix 
    ./wc-core.nix 

    /* window manager plus
    packages for the desktop */
    ./userpkgs.nix
    ../river.nix
  ];

  # enables home manager
  programs.home-manager.enable = true;

  # Value of configuration compatible with Home Manager. To keep
  # it avoids breakage due to changes.
  #
  # No need to change it but, if you want to, read the release notes.
  home.stateVersion = "25.05";
}
