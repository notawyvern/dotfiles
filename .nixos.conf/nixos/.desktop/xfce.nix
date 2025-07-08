{ config, pkgs, callPackage, ... }:

{
    services.xserver.enable = true;
    
    # Enable lightdm
    services.xserver.displayManager.lightdm.enable = true;

    services.xserver.desktopManager = {
	xfce.enable = true;
	xterm.enable = false;
};
    programs.thunar = {
	enable = true;
	plugins = with pkgs.xfce; [
		thunar-archive-plugin
		];
	};
    
     # services.redshift.enable = true;
     services.flatpak.enable = true;	

     xdg.portal = {
	enable = true;
	extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	xdgOpenUsePortal = true;
};

     environment.xfce.excludePackages = with pkgs; [
	xfce.mousepad
	xfce.parole
	xfce.ristretto
	xfce.xfce4-appfinder
	xfce.xfce4-taskmanager
	xfce.xfce4-terminal
	];	

	environment.systemPackages = with pkgs; [
		alacritty
		xfce.xfce4-whiskermenu-plugin
		redshift
    ];

}
