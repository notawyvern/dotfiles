{ config, lib, pkgs, pkgs-unstable, ... }:
{

  users.users.crh.packages = 
	(with pkgs; [
		# core
		vim
		git
		htop
		efibootmgr
		fastfetch

		# desktop apps
		virtualboxKvm
		vscodium-fhs
		upscayl
		localsend
		haruna
		qalculate-gtk
		kdePackages.kolourpaint 
])
		++

	(with pkgs-unstable; [
		ruffle
		freetube
		harmony-music
]);

  /* disable the nscd service,
  aimed at servers and not desktops */
  services.nscd.enable = false;
  system.nssModules = lib.mkForce [];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
  # Automatic updates
  system.autoUpgrade = {
	enable = true;
	dates = "weekly";
	flake = "path:/etc/nixos";
	};

  # Automatic cleanup
  nix.gc = {
	automatic = true;
  	dates = "daily";
  	options = "--delete-older-than 10d";
	};

  nix.settings.auto-optimise-store = true; 

  # enables flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Safer to leave value at the first install's version number. 
  # Read docs before changing it ( eg. man configuration.nix )
  system.stateVersion = "25.05"; # Did you read the comment?

}
 
