{ config, pkgs, ... }:
{
  programs.sway = {
    enable = true;
    package = null;
    extraPackages = [ ];
  };

  environment.etc."greetd/sway.conf" = {
    text = with pkgs;
    ''
    exec "${gtkgreet}/bin/gtkgreet -l -c ${sway}/bin/sway; ${sway-unwrapped}/bin/swaymsg exit"
    include /etc/sway/config.d/*
    input type:touchpad { 
      tap enabled 
      }
    '';
    mode = "444";
  };

  services.greetd = {
    enable = true;
    restart = true;
    settings = {
      default_session = {
        command = with pkgs;
        ''${sway}/bin/sway --config /etc/greetd/sway.conf'';
      };
    };
  };

}
 
