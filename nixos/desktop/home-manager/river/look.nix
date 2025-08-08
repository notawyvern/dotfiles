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
      "Imagens/wallpapers/magical-land-japan.jpg".source =
        pkgs.fetchurl { 
          url = "https://raw.githubusercontent.com/notawyvern/wallpapers/refs/heads/main/magical-land-japan.jpg";
          sha256 = "658bbab1a59e8f53e96b25687b04a073a50814ea72ea5d50da0fb90690775cc4";
        };
    };
  };
}
