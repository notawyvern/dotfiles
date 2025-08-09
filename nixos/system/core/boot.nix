{ config, pkgs, bootloader, ...}:
{
  # Bootloader.
  boot.loader.limine = {
    enable = true;
    additionalFiles =
      { "/boot/efi/boot/SIGN.EFI" = "${bootloader.limine}/share/limine/BOOTX64.EFI"; };
    style = {
      wallpapers = [];
      graphicalTerminal = {
        background = "000000";
        foreground = "ffffff";
      };
    };
  };
}

