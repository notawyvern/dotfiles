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
    bashrcExtra = # to call ps1 in all sessions it must be here
      ''
        export PS1="\[\e]0;\u@\h: \w\a\]\[\033[1;32m\][\s \V \w]\$\[\033[0m\] "
        set -o vi
        bind -m vi-command 'Control-l: clear-screen'
        bind -m vi-insert 'Control-l: clear-screen'
        bind -m vi-insert 'set completion-ignore-case on'
      '';
  };

  programs.fish = {
    enable = true;
    binds = {
        "ctrl-e --mode insert".command = "accept-autosuggestion";
    };
    functions = {
      fish_greeting = ""; fish_mode_prompt = "";
      fish_user_key_bindings = "fish_vi_key_bindings default";
      fish_prompt = "echo -s ''(set_color --bold green) [$USER@$hostname:$PWD]'$ '";
    };
    shellAliases.neofetch = "fastfetch";
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      mouse = "a";
    };
    };
  
}
