{ config, pkgs, pkgs-unstable, ... }:

{
  home = {
    username = "crh";
    homeDirectory = "/home/crh";
    packages =
      (with pkgs; [
        # command line
        efibootmgr

        # desktop apps
        virtualboxKvm
        upscayl
        localsend
        haruna
        qalculate-gtk
        kdePackages.kolourpaint 
        cosmic-files
        cosmic-edit
        qview

        # core for river wc
        brightnessctl
        wayshot
        swaybg
	
        # theming
        adwaita-icon-theme
        nerd-fonts.departure-mono 
      ])
          ++
  
      (with pkgs-unstable; [
        # more desktop apps
        ruffle
        harmony-music
      ]);
    };
    
  xdg = {
    desktopEntries = {
      gvim = {
        name = "gvim";
        noDisplay = true;
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/jpeg" = "com.interversehq.qView.desktop";
        "image/png" = "com.interversehq.qView.desktop";
      };
      associations.added = {
        "image/jpeg" = "com.interversehq.qView.desktop";
        "image/png" = "com.interversehq.qView.desktop";
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
