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
