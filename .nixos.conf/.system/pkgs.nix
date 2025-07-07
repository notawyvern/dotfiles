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
		retroarch-full
		freetube
]);

  /* disable the nscd service,
  aimed at servers and not desktops */
  services.nscd.enable = false;
  system.nssModules = lib.mkForce [];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
  services.flatpak.enable = true;

  systemd.user.extraConfig = ''
	DefaultEnvironment="PATH=/run/current-system/sw/bin"
'';

  # Automatic updates
  system.autoUpgrade = {
	enable = true;
	dates = "weekly";
	};

  # Automatic cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true; 

  # enables flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
 
