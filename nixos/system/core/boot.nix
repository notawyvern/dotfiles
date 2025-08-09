{ config, pkgs, ...}:
{
  # Bootloader.
  boot.loader.limine = {
    enable = true;
    additionalFiles =
      { "/boot/efi/boot/SIGN.EFI" = "/boot/efi/boot/BOOTX64.EFI"; };
    style = {
      wallpapers = [];
      graphicalTerminal = {
        background = "000000";
        foreground = "ffffff";
      };
    };
  };
}

