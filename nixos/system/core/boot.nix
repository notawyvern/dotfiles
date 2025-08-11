{ config, pkgs, bootloader, ...}:
{
  # Bootloader.
  boot.loader.limine = {
    enable = true; # installs a stable limine for a backup efi
    additionalFiles =
      { "/boot/efi/boot/DEFAULT.EFI" = "${bootloader.limine}/share/limine/BOOTX64.EFI"; };
    style = {
      wallpapers = [];
      graphicalTerminal = {
        background = "000000";
        foreground = "ffffff";
      };
    };
  };
}

