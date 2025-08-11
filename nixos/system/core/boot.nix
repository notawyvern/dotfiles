{ config, pkgs, bootloader, ...}:
{
  # Bootloader.
  boot.loader.limine = {
    enable = true;
    style = {
      wallpapers = [];
      graphicalTerminal = {
        background = "000000";
        foreground = "ffffff";
      };
    };
  };
}

