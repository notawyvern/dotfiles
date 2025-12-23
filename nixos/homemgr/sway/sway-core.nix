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

  programs.waybar = {
    systemd.enable = true;
    enable = true;
    settings = {
      bar = {
        position = "top";

        modules-left = [ "sway/workspaces" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "network" "battery" "pulseaudio" "clock" ];

        "sway/window".tooltip = false;

        "network" = {
          format = "{ifname}";
          format-wifi = " {signalStrength}%";
          tooltip = false;
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = ["" "" "" "" ""];
        };

        "pulseaudio" = {
          format = " {volume}%";
          format-bluetooth = " {volume}%";
          format-muted = "";
        };

        "clock" = {
          format = " {:%d/%m/%Y %H:%Mh}";
          tooltip = false;
        };

      };
    };
  };
}
