{ config, pkgs, ... }:

{
    # Enable the Cinnamon Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager = {
	gnome.enable = true;
};
    services.gnome = {
	core-utilities.enable = false;	
	core-developer-tools.enable = false;
	games.enable = false;
	tinysparql.enable = false;

};
    
    environment.systemPackages = with pkgs; [
	alacritty
	fastfetch
	nautilus
	gnomeExtensions.pop-shell
  ];

    services.flatpak.enable = true;	
}
