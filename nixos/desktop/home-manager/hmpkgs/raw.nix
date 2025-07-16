{ config, pkgs, pkgs-unstable, ... }:

{
  home = {
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
}
