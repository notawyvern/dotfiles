{ config, pkgs, pkgs-unstable, ... }:

{
  home = {
    packages =
      (with pkgs; [
        # desktop apps
        virtualboxKvm
        upscayl
        localsend
        haruna
        qalculate-gtk
        kdePackages.kolourpaint 
        cosmic-files
        cosmic-edit

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
