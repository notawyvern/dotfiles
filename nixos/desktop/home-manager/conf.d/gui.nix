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
  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      font = {
        size = 16;
          normal.family = "DepartureMono Nerd Font";
        };

      selection.save_to_clipboard = true;
      colors = {
        primary.foreground = "#ffffff";
        primary.background = "#000000";	
      };
    };
  };

}
