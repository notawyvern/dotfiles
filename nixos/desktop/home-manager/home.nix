{ config, pkgs, ... }:

{
  home = {
    username = "crh";
    homeDirectory = "/home/crh";
  };
    
  xdg = {
    desktopEntries = {
      htop = {
        name = "Htop";
        exec = "alacritty -e htop";
        terminal = false;
      };
      vim = {
        name = "Vim";
        noDisplay = true;
      };
      gvim = {
        name = "gvim";
        noDisplay = true;
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/jpeg" = "swayimg.desktop";
        "image/png" = "swayimg.desktop";
      };
      associations.added = {
        "image/jpeg" = "swayimg.desktop";
        "image/png" = "swayimg.desktop";
      };
      associations.removed = {
        "image/jpeg" = "org.kde.kolourpaint.desktop";
        "image/png" = "org.kde.kolourpaint.desktop";
      };
    };
  };

  # enables home manager
  programs.home-manager.enable = true;

  # Value of configuration compatible with Home Manager. To keep
  # it avoids breakage due to changes.
  #
  # No need to change it but, if you want to, read the release notes.
  home.stateVersion = "25.05";
}
