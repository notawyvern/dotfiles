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
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    file = {
      "Imagens/wallpapers/wallpaper.jpeg".source =
        pkgs.fetchurl { 
          url = "https://i.imgur.com/WdoW1BX.jpeg";
          sha256 = "ea8f8a05aea7db9de07bd485b1ffab5cdcb031dc6daef3f524de9c49728f9511";
        };
    };
  };
}
