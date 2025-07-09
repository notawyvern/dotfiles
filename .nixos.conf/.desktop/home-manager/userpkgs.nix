{ config, pkgs, pkgs-unstable, ... }:

{
  home = {
    packages =
      (with pkgs; [
        # core
        htop
        efibootmgr
        fastfetch

        # desktop apps
        virtualboxKvm
        vscodium-fhs
        upscayl
        localsend
        haruna
        qalculate-gtk
        kdePackages.kolourpaint 
        cosmic-files
        cosmic-edit
        qview
        sioyek

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
        freetube
        harmony-music
      ]);

    };
}
