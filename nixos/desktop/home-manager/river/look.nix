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
          rev = "52802dc087f6cb78f59491c78df26c87e7c7bc83";
          sha256 = "sha256-TTAQyhTM4MdwD4nAP6zO2oPFhEpH0H7+3Fl6C5jgDIM=";
        };
    };
  };
}
