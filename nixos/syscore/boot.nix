{ config, pkgs, ...}:
{
  # Bootloader.
  boot.loader = {
    timeout = 1;
    limine = {
      enable = true;
      secureBoot.enable = true;
      style = {
        wallpapers = [];
        graphicalTerminal = {
          background = "000000";
          foreground = "ffffff";
        };
      };
    };
  };
}
