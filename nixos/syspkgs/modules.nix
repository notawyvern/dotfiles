{ config, lib, pkgs, ... }:
{
  # trash for file manager
  services.gvfs.enable = true;

  programs.dconf.enable = true;

  /* disable the nscd service,
  aimed at servers and not desktops */
  services.nscd.enable = false;
  system.nssModules = lib.mkForce [];
  
  # gui for bluetooth  
  services.blueman.enable = true;
 
  # disable nano
  programs.nano.enable = false;

}
 
