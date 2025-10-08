{ config, pkgs, ... }:
{
  /* a global install of sway allows 
  gtkgreet execution before user session */
  programs.sway = {
    enable = true;
    extraPackages = [ ];
  };

  environment.etc."greetd/sway.conf" = {
    text = with pkgs;
    ''
    exec "${greetd.gtkgreet}/bin/gtkgreet -l -c sway; swaymsg exit"
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
    vt = 7;
    settings = {
      default_session = {
        command = with pkgs;
        ''${sway}/bin/sway --config /etc/greetd/sway.conf'';
      };
    };
  };

}
 
