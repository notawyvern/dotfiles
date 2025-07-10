{ config, pkgs, ... }:

{

  # basic configuration of git, please change to your own
  programs.git = {
	enable = true;
	userName = "notawyvern";
	userEmail = "218308804+notawyvern@users.noreply.github.com";
  };

  programs.bash = {
	enable = true;
        enableCompletion = true;
        sessionVariables = {
          EDITOR = "vim";
          VISUAL = "$EDITOR";
        };
    # set some aliases, feel free to add more or remove some
	shellAliases = {
		neofetch = "fastfetch";
		vdir = "vdir --color=auto";
		dir = "dir --color=auto";
		};
	bashrcExtra =
        ''
	set -o vi
	bind -m vi-command 'Control-l: clear-screen'
	bind -m vi-insert 'Control-l: clear-screen'
	'';	
        };

  # text editor
  programs.vim.enable = true;
  
}
