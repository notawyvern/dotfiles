{ config, pkgs, ... }:

{
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # versao minima do pantheon
    services.xserver.desktopManager.pantheon.enable = true;
    services.pantheon.apps.enable = false;

    environment.systemPackages = with pkgs; [
	alacritty
	fastfetch
  ];

    services.flatpak.enable = true;	
}
