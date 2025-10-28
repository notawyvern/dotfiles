{ config, pkgs, ... }:

{
  wayland.windowManager.river = {
    enable = true;
    settings = {
      input = {
        "pointer-1739-52545-SYNA7DB5:00_06CB:CD41_Touchpad" = "tap enabled";
      };
      keyboard-layout = "br";
      map-pointer = {
        normal = {
          "Super BTN_LEFT" = "move-view";
        };
      };
      map = {
        normal = {
          # basic custom
          "Super T" = "spawn alacritty";
          "Super B" = "spawn qutebrowser";
          "Super D" = "spawn tofi-drun";

          # audio
          "None XF86AudioRaiseVolume" = "spawn 'wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+'";
          "None XF86AudioLowerVolume" = "spawn 'wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-'";
          "None XF86AudioMute" = "spawn 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'";

          # video
          "None XF86MonBrightnessUp" = "spawn '${pkgs.brightnessctl}/bin/brightnessctl set +5%'";
          "None XF86MonBrightnessDown" = "spawn '${pkgs.brightnessctl}/bin/brightnessctl set 5%-'";
          "None Print" = "spawn '${pkgs.wayshot}/bin/wayshot -c -e jpg'";

          # wm basics

          "Super+Shift E" = "exit";
          "Super F" = "toggle-fullscreen";
          "Super Space" = "toggle-float";
          "Super Q" = "close";
          "Super J" = "focus-view next";
          "Super K" = "focus-view previous";

          "Super Up" = "send-layout-cmd rivertile 'main-location top'";
          "Super Down" = "send-layout-cmd rivertile 'main-location bottom'";
          "Super Left" = "send-layout-cmd rivertile 'main-location left'";
          "Super Right" = "send-layout-cmd rivertile 'main-location right'";

          "Super H" = "send-layout-cmd rivertile 'main-ratio -0.05'";
          "Super L" = "send-layout-cmd rivertile 'main-ratio +0.05'";
          "Super+Shift H" = "send-layout-cmd rivertile 'main-count +1'";
          "Super+Shift L" = "send-layout-cmd rivertile 'main-count -1'";

          "Super 1" = { set-focused-tags = "1"; };
          "Super 2" = { set-focused-tags = "2"; };
          "Super 3" = { set-focused-tags = "4"; };
          "Super 4" = { set-focused-tags = "8"; };
          "Super 5" = { set-focused-tags = "16"; };
          "Super 6" = { set-focused-tags = "32"; };
          "Super 7" = { set-focused-tags = "64"; };
          "Super 8" = { set-focused-tags = "128"; };
          "Super 9" = { set-focused-tags = "256"; };
          # focus all tags
          "Super 0" = { set-focused-tags = "4294967295"; };

          "Super+Shift 1" = { set-view-tags = "1"; };
          "Super+Shift 2" = { set-view-tags = "2"; };
          "Super+Shift 3" = { set-view-tags = "4"; };
          "Super+Shift 4" = { set-view-tags = "8"; };
          "Super+Shift 5" = { set-view-tags = "16"; };
          "Super+Shift 6" = { set-view-tags = "32"; };
          "Super+Shift 7" = { set-view-tags = "64"; };
          "Super+Shift 8" = { set-view-tags = "128"; };
          "Super+Shift 9" = { set-view-tags = "256"; };

          "Super+Shift+Control 1" = { toggle-view-tags = "1"; };
          "Super+Shift+Control 2" = { toggle-view-tags = "2"; };
          "Super+Shift+Control 3" = { toggle-view-tags = "4"; };
          "Super+Shift+Control 4" = { toggle-view-tags = "8"; };
          "Super+Shift+Control 5" = { toggle-view-tags = "16"; };
          "Super+Shift+Control 6" = { toggle-view-tags = "32"; };
          "Super+Shift+Control 7" = { toggle-view-tags = "64"; };
          "Super+Shift+Control 8" = { toggle-view-tags = "128"; };
          "Super+Shift+Control 9" = { toggle-view-tags = "256"; };
          
        };
      };
      focus-follows-cursor = "normal";

      border-color-focused = "0x0088cc";
      border-color-unfocused = "0x586e75";

      default-layout = "rivertile";
      rule-add = {
        "-title"."'Qalculate!'" = "float";
        "-app-id"."'swayimg'" = "float";
      };
      spawn = [
        "i3bar-river"
        "'${pkgs.swaybg}/bin/swaybg -i ${config.home.homeDirectory}/.wallpapers/magical-land-japan.jpg'"
      ];
    };
    extraConfig =
      ''rivertile -view-padding 6 -outer-padding 6 -main-ratio 0.5 -main-location right &'';
    };
}
