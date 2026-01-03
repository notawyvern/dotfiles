{ config, pkgs, ... }:
{
  services.displayManager.sessionPackages = [ pkgs.sway ];
  programs.sway = with pkgs; {
    enable = true; # installs required files for compositing
    extraPackages = [ kdePackages.breeze-icons adwaita-icon-theme adw-gtk3 ]; # needed for theming
    package = null;
  };

  environment.etc = {
    "greetd/regreet.toml" = with config.stylix; {
      text = 
        ''
          [background]
          path = "${image}"
          fit = "Fill"

          [GTK]
          application_prefer_dark_theme = ${if (polarity == "dark") then "true" else "false"}
          icon_theme_name = ${if (polarity == "dark") then ''"breeze-dark"'' else ''"breeze"'' }
          theme_name = ${if (polarity == "dark") then ''"adw-gtk3-dark"'' else ''"adw-gtk3"'' }
        '';
        mode = "444";
    };
    "regreet/compose.conf" = {
      text =
        ''
          exec "${pkgs.regreet}/bin/regreet; ${pkgs.sway-unwrapped}/bin/swaymsg exit"

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
        command = "${sway-unwrapped}/bin/sway -c /etc/regreet/compose.conf";
      };
    };
  };
}
 
