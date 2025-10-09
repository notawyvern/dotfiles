{ config, pkgs, ... }:

{
  imports = [
    ({pkgs, ...}: {
      home.packages = [ pkgs.nerd-fonts.departure-mono ];
    })
  ];

  home = {
    pointerCursor = {
      enable = true;
      size = 24;
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    file = {
      ".wallpapers/".source =
        pkgs.fetchFromGitHub {
          owner = "notawyvern";
          repo = "wallpapers";
          rev = "bf660f36c3d74925d578a30245621e9e17cc3343";
          sha256 = "sha256-CQOKgEvCbppnbzbVKFeV2JDVKPoU2FX3ZWvpI/JAGFI=";
        };
    };
  };
}
