{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.displayManager.enable = true;
  services.xserver.desktopManager = {
    xterm.enable = false;
    lxqt.enable = true;
  };
  environment.lxqt.excludePackages = with pkgs.lxqt; [ 
    qps
    qterminal 
  ];
}
