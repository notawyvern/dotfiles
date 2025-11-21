{ config, pkgs, pkgs-unstable, ... }:

{
  home = {
    packages =
      (with pkgs; [
        /* desktop apps */

        # core
        qalculate-gtk
        cosmic-files
        cosmic-edit
        networkmanagerapplet
        
        # extra
        virtualboxKvm
        upscayl
        kdePackages.kolourpaint 

        # core for river wc
        brightnessctl
        wayshot
        swaybg
      ])
          ++
  
      (with pkgs-unstable; [
        # more desktop apps
        ruffle
        muffon
      ]);
    };
}
