{ config, pkgs, ...}:
{
  # Bootloader.
  boot.loader = {
    timeout = 1;
    limine = {
      enable = true;
      secureBoot.enable = true;
    };
  };
}
