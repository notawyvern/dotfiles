{ config, pkgs, ... }:

{

    services.displayManager.cosmic-greeter.enable = true;
    # Enable the Cosmic Desktop Environment.
    services.desktopManager = {
	cosmic.enable = true;
};
}
