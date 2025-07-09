{ config, lib, pkgs, pkgs-unstable, ... }:
{

  users.users.crh.packages = 
	(with pkgs; [
		# core
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
                cosmic-files
	        cosmic-edit
	        qview
	        sioyek

	        # core for river wc
	        brightnessctl
	        wayshot
	        wlsunset
	        swaybg
	
	        # theming
	        adwaita-icon-theme
	
              ])
		++

	(with pkgs-unstable; [
		ruffle
		freetube
		harmony-music
              ]);

  /* install the login manager for all users
  (including root & greetd, so it works) */
  environment.systemPackages =
  with pkgs; [ greetd.gtkgreet cage ];

  services.greetd = {
	enable = true;
	restart = true;
	vt = 7;
	settings = {
	default_session = {
		command = ''
		cage -d -s -- gtkgreet -c river
		'';
	};
	};
	};

  # enable trash for file managers
  services.gvfs.enable = true;

  fonts.packages = with pkgs; [ nerd-fonts.departure-mono ];

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
 
