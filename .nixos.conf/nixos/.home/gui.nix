{ config, pkgs, ... }:

{

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
	enable = true;
	# custom settings
	settings = {
		font = {
        	size = 16;
		normal.family = "DepartureMono Nerd Font";
		};

		selection.save_to_clipboard = true;
		colors = {
		primary.foreground = "#ffffff";
		primary.background = "#000000";	
		};
    };
  };

}
