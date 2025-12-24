{ config, pkgs, ... }:

{
  # menu to run programs
  programs.tofi = {
    enable = true;
    settings = {
      history = false;
      prompt-text = ''" "'';
      hide-cursor = true;
      drun-launch = true;
    };
  };

  # power menu
  programs.wlogout = {
    enable = true;
    package = null; # a sway keybinding sources the path instead
    layout = with pkgs; [
      {
        label = "reboot";
        action = "${systemd}/bin/systemctl reboot";
        text = "reboot";
      }
      {
        label = "reboot";
        action = "${sway-unwrapped}/bin/swaymsg reload";
        text = "swaymsg reload";
      }
      {
        label = "shutdown";
        action = "${systemd}/bin/systemctl poweroff";
        text = "poweroff";
      }
      {
        label = "shutdown";
        action = "${alacritty}/bin/alacritty -e ${htop}/bin/htop";
        text = "htop";
      }
      { 
        label = "suspend";
        action = "${systemd}/bin/systemctl suspend";
        text = "suspend";
      }
      {
        label = "logout";
        action = "${systemd}/bin/loginctl terminate-user $USER";
        text = "terminate-user";
      }
    ];
  };

  # night light color temperature
  services.wlsunset = {
    enable = true;
    sunset = "17:30";
    sunrise = "5:00";
    temperature.day = 6500;
    temperature.night = 2800;
  };

  programs.i3status = {
    enable = true;
    enableDefault = false;
    general = {
      separator = "";
      output_format = "i3bar";
      colors = true;
      interval = 5;
    };
    modules = {
      "wireless wlan0" = {
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
          format_down = "";
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
          format = " 󰝚 %volume";
          format_muted = " 󰝛 %volume";
          device = "default";
          mixer = "Master";
          mixer_idx = 0;
        };
      };
      "tztime localdate" = {
        position = 4;
        settings = {
          format = "  %d/%m/%Y";
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
