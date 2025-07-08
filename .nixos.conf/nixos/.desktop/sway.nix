{ config, pkgs, ... }:
{

  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs;
	[ greetd.gtkgreet ];

  environment.etc = {
  "greetd/loginmgr.conf" = {
    text = ''
	# `-l` activates layer-shell mode. Notice that `swaymsg exit` will run after gtkgreet.
	exec "gtkgreet -l -c sway; swaymsg exit"

	input "type:touchpad" {
		tap enabled
	}

	include /etc/sway/config.d/*
    '';
    mode = "644";
  };
};

  services.greetd = {
	enable = true;
	restart = true;
	vt = 7;
	settings = {
	default_session = {
		command = ''
		sway --config /etc/greetd/loginmgr.conf
		'';
	};
	};
	};

  # enable trash for file managers
  services.gvfs.enable = true;

  fonts.packages = with pkgs; [
	nerd-fonts.departure-mono
	];

  # enable sway window manager
  programs.sway = {
    extraPackages = with pkgs;
	[ 
	/* wm controls
	and gui */
	brightnessctl
	wl-clipboard-rs
	wayshot
	wlsunset
	tofi
	i3status-rust
	
	# basic apps 
	alacritty
	cosmic-files

	# theming
	adwaita-icon-theme
	];
    enable = true;
  };

}

