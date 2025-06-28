{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
	./hardware-configuration.nix

	./.system/networking.nix
	./.system/audio.nix
	./.system/swap.nix
	./.system/pkgs.nix
		
	./.core/boot.nix
	./.core/users.nix
	./.core/locale.nix

#	./.desktop/cinnamon.nix
#	./.desktop/sway.nix
	./.desktop/river.nix
#	./.desktop/lxqt.nix
#	./.desktop/lxqt-wayland.nix
#	./.desktop/cosmic.nix
#	./.desktop/xfce.nix
#	./.desktop/gnome.nix
#	./.desktop/pantheon.nix

    ];

  # Safer to leave value at the first install's version number. 
  # Read docs before changing it ( eg. man configuration.nix )
  system.stateVersion = "25.05"; # Did you read the comment?

}
