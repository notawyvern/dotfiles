{ config, pkgs, pkgs-unstable, ... }:

{
  home = {
    packages =
      (with pkgs; [
        # desktop apps
        virtualboxKvm
        upscayl
        localsend
        vlc
        qalculate-gtk
        kdePackages.kolourpaint 

      ])
          ++
  
      (with pkgs-unstable; [
        ruffle
        spotube
        yt-dlp # allows its backend for spotube
      ]);
    };
}
