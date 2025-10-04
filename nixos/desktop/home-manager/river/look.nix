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
      ".wallpapers/".source =
        pkgs.fetchFromGitHub {
          owner = "notawyvern";
          repo = "wallpapers";
          rev = "2f54b7b0e683c9f6e4f8d3950d5eb045d8038fc2";
          sha256 = "sha256-OnzIX6uWhM8E69aZ5oariQ1UYbPGfUJfKGbxn9lRle0=";
        };
    };
  };
}
