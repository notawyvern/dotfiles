{ config, pkgs, pkgs-unstable, ... }:

{
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

  services.redshift = {
    enable = true;
    tray = true;
    duskTime = "17:00-17:30";
    dawnTime = "5:00-5:30";
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
