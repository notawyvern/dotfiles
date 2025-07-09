{ config, pkgs, ... }:
{

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.crh = {
	isNormalUser = true;
	description = "crh";
	extraGroups = [ "networkmanager" "wheel" ];
  };
}
 
