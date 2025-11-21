{ config, pkgs, pkgs-unstable, ... }:

{
  programs.sioyek = {
    enable = true;
    config = {
      "font_size" = "13";
      "status_bar_font_size" = "15";
      "ui_font" = "DepartureMono Nerd Font";
    };
    bindings = {
      toggle_dark_mode = "<C-i>";
      next_page = "J";
      previous_page = "K";
    };

  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      font = {
        size = 16;
          normal.family = "DepartureMono Nerd Font";
        };

      selection.save_to_clipboard = true;
      colors = {
        primary.foreground = "#ffffff";
        primary.background = "#000000";	
      };
    };
  };

  programs.swayimg = {
    enable = true;
    settings = {
      "keys.viewer" = {
        h = "prev_file";
        l = "next_file";
      };
      general = {
        mode = "viewer";
        size = "900,700";
      };
      list.all = "yes";
      font.name = "DepartureMono Nerd Font";
    };
  };
  
  programs.freetube = {
    enable = true;
    package = pkgs-unstable.freetube;
    settings = {
      autoplayVideos = false;
      hideHeaderLogo = true;
      hideLiveChat = true;
      hidePopularVideos = true;
      hideRecommendedVideos = true;
      hideSubscriptionsShorts = true;
      hideChannelShorts = true;
      hideTrendingVideos = true;
      checkForUpdates = false;
      checkForBlogPosts = false;
      playNextVideo = false;
      useDeArrowTitles = true;
      useDeArrowThumbnails = true;
      useRssFeeds = true;
      useSponsorBlock = true;
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium-fhs;
    profiles.default = { 
      enableExtensionUpdateCheck = true;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        github.vscode-pull-request-github
      ];
      userSettings = { 
        "git.autofetch" = true; 
        "workbench.colorTheme" = "Default Light Modern";
      };
    };
  };

}
