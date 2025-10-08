{ config, pkgs, ... }:
{
  /* the global install prevents an attempt to 
  use unseen features nonstop that lag sway's 
  and gtkgreet's loading */
  programs.sway = {
    enable = true;
    extraPackages = [ ];
  };

  environment.etc."greetd/sway.conf" = {
    text = with pkgs;
    ''
    exec "${greetd.gtkgreet}/bin/gtkgreet -l -c ${sway}/bin/sway; swaymsg exit"
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
 
