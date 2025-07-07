{ config, pkgs, ... }:

{
    # Enable the X11 windowing system.
    services.xserver = {
	desktopManager.lxqt.enable = true;
	enable = true;
	excludePackages =
		[ pkgs.xterm ];
};

    environment.lxqt.excludePackages = with pkgs; [
	lxqt.qterminal 
	lxqt.qps
];	

    environment.systemPackages = with pkgs; [
	# core for de
	alacritty
	redshift
	nm-tray

	# desktop apps
	qpdfview
	featherpad
  ];

     /* configure portals and avoid
     installation of wlr one */
     xdg.portal = {
	lxqt.enable = true;
	extraPortals = 
		[ 
		pkgs.xdg-desktop-portal-gtk
		 ];
		xdgOpenUsePortal = true;
	};

}
