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
      "Imagens/".source =
        pkgs.fetchFromGitHub {
          owner = "notawyvern";
          repo = "wallpapers";
          rev = "60dd8a4756713224f86755b23d72e1abe7e2fb6d";
          sha256 = "sha256-lExSL1ytMMPupWSDx5oxxwiCiK1eFlvnLhWoI89cWLY=";
        };
    };
  };
}
