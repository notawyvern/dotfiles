{ config, pkgs, ... }:

{
  programs.sioyek = {
    enable = true;
    config = {
      "font_size" = "13";
      "status_bar_font_size" = "15";
      "ui_font" = "DepartureMono Nerd Font";
    };
    bindings = {
     toggle_dark_mode = "<C-i>";
    };

  };
}
