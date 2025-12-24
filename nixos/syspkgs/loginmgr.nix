{ config, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    restart = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = with pkgs;
        ''${tuigreet}/bin/tuigreet --asterisks -c ${sway-unwrapped}/bin/sway'';
      };
    };
  };

}
 
