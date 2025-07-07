{ config, pkgs, ... }:

{
    # Enable the X11 windowing system.
    services.xserver = {
	enable = true;
	excludePackages =
		[ pkgs.xterm ];
};

    # Enable lxqt
    services.xserver.desktopManager = {
	lxqt.enable = true;
	};

    programs.regreet.enable = true;

    environment.lxqt.excludePackages = with pkgs; [
	openbox
	lxqt.qterminal 
	lxqt.qps
	lxqt.lximage-qt
];	

    environment.systemPackages = with pkgs; [
	# extras
	alacritty
	gammastep
	networkmanagerapplet
	# core
	lxqt.lxqt-wayland-session
	labwc
	labwc-tweaks
	xwayland
  ];

    xdg.portal = {
	lxqt.enable = true;
	extraPortals = 
		[ pkgs.xdg-desktop-portal-gtk ];
		xdgOpenUsePortal = true;
	};

}
