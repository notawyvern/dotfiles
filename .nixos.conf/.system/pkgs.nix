{ config, pkgs, lib, ... }:
{

  users.users.crh = {
	packages = with pkgs; [
		vim
		efibootmgr
		fastfetch
		htop
		git
];
};

  /* disable the nscd service,
  aimed at servers and not desktops */
  services.nscd.enable = false;
  system.nssModules = lib.mkForce [];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
  services.flatpak.enable = true;

  systemd.user.extraConfig = ''
	DefaultEnvironment="PATH=/run/current-system/sw/bin"
'';

  # Automatic updates
  system.autoUpgrade = {
	enable = true;
	dates = "weekly";
	};

  # Automatic cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true; 

}
 
