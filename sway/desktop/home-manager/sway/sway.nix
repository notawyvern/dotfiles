{ config, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = {
      modifier = "Mod4";
      
      output."*".bg = "~/.wallpapers/magical-land-japan.jpg stretch";
      window = {
        titlebar = false;
        commands = [
          {
            command = "floating enable";
            criteria.app_id = "qalculate-gtk";
          }
        ];
      };
      gaps = {
        inner = 7;
        smartGaps = true;
        smartBorders = "on";
      };
      input."*" = {
        xkb_layout = "br";
        tap = "enabled";
      };
      keybindings = {
        # basics
        "Mod4+b" = "exec qutebrowser";
        "Mod4+t" = "exec ${pkgs.alacritty}/bin/alacritty";
        "Mod4+d" = "exec ${pkgs.tofi}/bin/tofi-drun";
        "Mod4+q" = "kill";

        # workspaces
        "Mod4+1" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+5" = "workspace number 5";
        "Mod4+6" = "workspace number 6";
        "Mod4+7" = "workspace number 7";
        "Mod4+8" = "workspace number 8";
        "Mod4+9" = "workspace number 9";
        "Mod4+0" = "workspace number 10";

        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5";
        "Mod4+Shift+6" = "move container to workspace number 6";
        "Mod4+Shift+7" = "move container to workspace number 7";
        "Mod4+Shift+8" = "move container to workspace number 8";
        "Mod4+Shift+9" = "move container to workspace number 9";
        "Mod4+Shift+0" = "move container to workspace number 10";

        # windowing
        "Mod4+h" = "focus left";
        "Mod4+j" = "focus down";
        "Mod4+k" = "focus up";
        "Mod4+l" = "focus right";

        "Mod4+Ctrl+h" = "move workspace to output left";
        "Mod4+Ctrl+j" = "move workspace to output down";
        "Mod4+Ctrl+k" = "move workspace to output up";
        "Mod4+Ctrl+l" = "move workspace to output right";

        "Mod4+Shift+h" = "move left";
        "Mod4+Shift+j" = "move down";
        "Mod4+Shift+k" = "move up";
        "Mod4+Shift+l" = "move right";

        # audio
        "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

        # video
        "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +5%";
        "XF86MonBrightnessDown" = "exec '${pkgs.brightnessctl}/bin/brightnessctl set 5%-'";
        "Print" = "exec ${pkgs.wayshot}/bin/wayshot -c -e jpg";
      };
      bars = [{
        statusCommand = "i3status";
        position = "top";
        fonts =
          {
            names = [ "DepartureMono Nerd Font" ];
            style = "Regular";
            size = 15.0;
          };
          }];
          };
        };
}
