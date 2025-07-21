{ config, lib, pkgs, ... }:
{

  /* disable the nscd service,
  aimed at servers and not desktops */
  services.nscd.enable = false;
  system.nssModules = lib.mkForce [];

  # disable nano
  programs.nano.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.auto-optimise-store = true; 

  # enables flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Safer to leave value at the first install's version number. 
  # Read docs before changing it ( eg. man configuration.nix )
  system.stateVersion = "25.05"; # Did you read the comment?

}
 
