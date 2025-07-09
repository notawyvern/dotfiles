{ config, pkgs, ... }:

{

  # dmenu alternative (tofi)
  programs.tofi = {
    enable = true;
    settings = {
      width = "100%";
      height = "100%";
      history = false;
      border-width = 0;
      outline-width = 0;
      horizontal = true;
      prompt-text = " ";
      padding-top = "5%";
      hide-cursor = true;
      result-spacing = 15;
      num-results = 0;
      font-size = 24;
      font = "DepartureMono Nerd Font";
      drun-launch = true;
      selection-color = "#0088cc";
      background-color = "#000A";
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

  # bar for river
  programs.i3bar-river = {
    enable = true;
    settings = {
      font = "DepartureMono Nerd Font 15";
      height = 23;
      command = "i3status";

      tag_fg = "#ffffff";
      tag_bg = "#282828ff";
      tag_focused_bg = "#0088cc";
      tag_focused_fg = "#ffffff";
      tag_urgent_bg = "#ffa500";
      tag_urgent_fg = "#ffffff";
      tag_inactive_bg = "#333333";
      tag_inactive_fg = "#888888";
    };
  };

  programs.i3status = {
    enable = true;
    enableDefault = false;
    general = {
      output_format = "i3bar";
      colors = true;
      interval = 5;
      color_good = "#aaff00";
      color_degraded = "#ffa500";
      color_bad = "#ff2200";
    };
    modules = {
      "wireless wlp2s0" = {
        position = 1;
        settings = {
          format_up = " %quality ";
          format_down = "";
          };
        };
      "battery 1" = {
        position = 2;
        settings = {
          format = "%status %percentage";
          last_full_capacity = true;
          integer_battery_capacity = true;
          low_threshold = 40;
          threshold_type = "percentage";
          status_chr = "󰂏";
          status_bat = "󰂌";
          status_full = "󰁹";
        };
      };
      "volume master" = {
        position = 3;
        settings = {
          format = " 󰝚 %volume ";
          format_muted = " 󰝛 %volume ";
          device = "default";
          mixer = "Master";
          mixer_idx = 0;
        };
      };
      "tztime localdate" = {
        position = 4;
        settings = {
          format = "  %d/%m/%Y ";
        };
      };
      "tztime localtime" = {
        position = 5;
        settings = {
          format = "  %H:%Mh ";
        };
      };
    };
  };
}
