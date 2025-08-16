{ config, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    restart = true;
    vt = 7;
    settings = {
      default_session = {
        command = with pkgs;
        ''${cage}/bin/cage -d -s -- ${greetd.gtkgreet}/bin/gtkgreet -c river'';
      };
    };
  };

}
 
