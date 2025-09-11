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
          rev = "660ebd644b09e514bbc8c3649f6784f6c083a1dd";
          sha256 = "sha256-6hLw8WsNn357SJwWOWyIC4kqCzZg9VoWFCv0kiQPy+s=";
        };
    };
  };
}
