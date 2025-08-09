{ config, pkgs, bootloader, ...}:
{
  # Bootloader.
  boot.loader.limine = {
    enable = true;
    package = bootloader.limine;
    style = {
      wallpapers = [];
      graphicalTerminal = {
        background = "000000";
        foreground = "ffffff";
      };
    };
  };
}

