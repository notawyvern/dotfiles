{ config, pkgs, ... }:
{
  programs.sway = with config.stylix; {
    enable = true; # installs required files for compositing
    extraPackages = [ cursor.package ]; # needed for cursor theming
    package = null;
  };

  environment.etc = {
    "greetd/environments" = with pkgs; {
      text = "${sway-unwrapped}/bin/sway";
      mode = "444";
    };
    "gtkgreet/style.css" = with config.stylix; {
      text = 
      ''  
        window {
        background: url("file://${image}") center / cover no-repeat;
        }
        
        box#body, entry, menu {
        color: ${if (polarity == "dark") then "#ffffff;" else "#000000;"}
        background-color: ${if (polarity == "dark") then "#131721;" else "#fffafa;"}
        }

        box#body {
        border-radius: 10px;
        padding: 50px;
        }
      '';
      mode = "444";
    };
    "gtkgreet/compose.conf" = {
      text =
        ''
          exec "${pkgs.gtkgreet}/bin/gtkgreet -l -s /etc/gtkgreet/style.css; \
          ${pkgs.sway-unwrapped}/bin/swaymsg exit"

          input "*" {
          xkb_layout br
          tap enabled
          }
          seat "*" {
          xcursor_theme "${config.stylix.cursor.name}" ${toString config.stylix.cursor.size}
          }

          include /etc/sway/config.d/*
        '';
      mode = "444";
    };
  };

  services.greetd = {
    enable = true;
    restart = true;
    settings = with pkgs; {
      default_session = {
        command = "${sway-unwrapped}/bin/sway -c /etc/gtkgreet/compose.conf";
      };
    };
  };
}
 
