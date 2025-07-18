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
 
  # Automatic updates
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    flake = "path:/etc/nixos";
    flags = [ "--recreate-lock-file" ];
  };

  # Automatic cleanup
  nix.gc = {
	automatic = true;
  	dates = "daily";
  	options = "--delete-older-than 8d";
	};

  nix.settings.auto-optimise-store = true; 

  # enables flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Safer to leave value at the first install's version number. 
  # Read docs before changing it ( eg. man configuration.nix )
  system.stateVersion = "25.05"; # Did you read the comment?

}
 
