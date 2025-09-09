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
        exec = with pkgs; "${alacritty}/bin/alacritty -e ${htop}/bin/htop";
        terminal = false;
      };
      firefox = {
        name = "hckrfox";
        exec = "firefox --name firefox %U";
        mimeType = [ 
          "text/html" 
          "text/xml" 
          "application/xhtml+xml"
          "application/vnd.mozilla.xul+xml"
          "x-scheme-handler/http" 
          "x-scheme-handler/https" 
        ];
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
        "image/png" = [ "org.kde.kolourpaint.desktop" "org.qutebrowser.qutebrowser.desktop" ];
        "image/jpeg" = [ "org.kde.kolourpaint.desktop" "org.qutebrowser.qutebrowser.desktop" ];
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
