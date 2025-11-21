{ config, pkgs, ... }:
{
  networking.hostName = "nixos"; # Define your hostname.

  # Enable network manager
  networking.networkmanager.enable = true;

  # bluetooth configuration
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

}
