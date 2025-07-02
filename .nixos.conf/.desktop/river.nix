{ config, pkgs, ... }:
{

  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs;
	[ greetd.gtkgreet cage ];

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

  fonts.packages = with pkgs; [
	nerd-fonts.departure-mono
	];

  programs.river = {
	extraPackages =	with pkgs; [
	# core for the wm
	brightnessctl
	wayshot
	wlsunset
	tofi
	swaybg
	i3bar-river
	i3status
	
	# desktop apps
	alacritty
	cosmic-files
	cosmic-edit
	qview
	sioyek

	# theming
	adwaita-icon-theme
	];
	enable = true;
	};

}

