{ config, pkgs, ...}:
{
	# Bootloader.
        boot.loader.systemd-boot = {
          enable = true;
          editor = false;
        };

	boot.loader.efi.canTouchEfiVariables = true;

}

