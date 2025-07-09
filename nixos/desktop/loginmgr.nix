{ config, pkgs, ... }:
{
  /* install the login manager for all users
  (including root & greetd, so it works) */
  environment.systemPackages =
  with pkgs; [ greetd.gtkgreet cage ];

  services.greetd = {
	enable = true;
	restart = true;
	vt = 7;
	settings = {
	default_session = {
		command = ''
		cage -d -s -- gtkgreet -c river
		'';
	};
	};
	};

}
 
