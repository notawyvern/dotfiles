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
#      "Imagens/".source =
      "Imagens/wallpapers/".source =
        pkgs.fetchFromGitHub {
          owner = "notawyvern";
          repo = "wallpapers";
          rev = "0df11e2c99c96f04978d56a880967e4c92942493";
          sha256 = "sha256-51Gl73wRNCiAD6P5j+RYjiwTbSbYVG6wbYBxmxU0ZSM=";
        };
    };
  };
}
