{ config, pkgs, ... }:

{
    # Enable the X11 windowing system.
    services.xserver = {
	enable = true;
	excludePackages =
		[ pkgs.xterm ];
	};

    # Enable the Cinnamon Desktop Environment.
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.desktopManager = {
	cinnamon.enable = true;
};
    services.cinnamon.apps.enable = false;
    
    environment.systemPackages = with pkgs; [
	alacritty
	cosmic-store
  ];

    services.flatpak.enable = true;	
}
