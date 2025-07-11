{ config, pkgs, pkgs-unstable, ... }:

{
  home = {
    packages =
      (with pkgs; [
        # core
        efibootmgr
        fastfetch

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
        wlsunset
        swaybg
	
        # theming
        adwaita-icon-theme
        nerd-fonts.departure-mono 
      ])
          ++
  
      (with pkgs-unstable; [
        ruffle
        harmony-music
      ]);

    };
}
