{ config, pkgs, pkgs-unstable, ... }:

{
  home = {
    packages =
      (with pkgs; [
        /* desktop apps */

        # core
        qalculate-gtk
        cosmic-edit
        iwgtk
        cosmic-files
        
        # extra
        virtualboxKvm
        upscayl
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
