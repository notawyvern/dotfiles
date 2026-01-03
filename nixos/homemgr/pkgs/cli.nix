{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title" "separator" "os" "host" "wm" "lm"
        "terminal" "bios" "locale" "uptime" "shell" 
        "kernel" "cpu" "gpu" "break" "colors"
      ];
    };
  };

  programs.htop = {
    enable = true;
    settings = {
      tree_view = 1;
      show_program_path = 0;
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "notawyvern";
      user.email = "218308804+notawyvern@users.noreply.github.com";
    };
  };

  programs.bash = {
    enable = true;
    sessionVariables = {
      PS1=''\[$(tput bold)\]\[$(tput setaf 2)\]\u@\h:\[$(tput setaf 4)\]\w \[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]'';
    };
    shellAliases = {
      neofetch = "fastfetch";
      dir = "dir --color=auto";
      vdir = "vdir --color=auto";
    };
    bashrcExtra =
      ''
        set -o vi
        bind -m vi-command 'Control-l: clear-screen'
        bind -m vi-insert 'Control-l: clear-screen'
        bind -m vi-insert 'set completion-ignore-case on'
      '';
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      mouse = "a";
    };
    };
  
}
