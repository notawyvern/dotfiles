{ config, pkgs, pkgs-unstable, ... }:

{
  home = {
    packages =
      (with pkgs; [
        # core for river wc
        brightnessctl
        wayshot
        swaybg

        # desktop apps
        virtualboxKvm
        upscayl
        localsend
        vlc
        qalculate-gtk
        kdePackages.kolourpaint 
        cosmic-files
        cosmic-edit
        qview

      ])
          ++
  
      (with pkgs-unstable; [
        ruffle
        muffon
      ]);
    };
}
