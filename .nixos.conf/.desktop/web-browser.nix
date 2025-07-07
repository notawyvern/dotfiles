{ config, pkgs, ... }:

{

  programs.firefox = {
	enable = true;
	languagePacks = [ "pt-BR" ];

	/* ---- POLICIES ---- */
	# Check about:policies#documentation for options.
	policies = {
		DisableTelemetry = true;
		DisableFirefoxStudies = true;
		EnableTrackingProtection = {
			Value= true;
			Locked = true;
			Cryptomining = true;
			Fingerprinting = true;
			};
		DisablePocket = true;
		RequestedLocales = "pt-BR";
		HttpsOnlyMode = "force_enabled";
		DisableFirefoxAccounts = true;
		DisableAccounts = true;
		OverrideFirstRunPage = "";
		OverridePostUpdatePage = "";
		DontCheckDefaultBrowser = true;
		DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
		SearchBar = "unified"; # alternative: "separate"

		FirefoxHome = {
			Sponsored = false;
			SponsoredPocket = false;
			TopSites = false;
			Highlight = false;
			Snippets = false;
			Locked = true;
			};

		Preferences = {
			"browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
			"privacy.userContext.enabled" = { Value = true; Status = "locked"; };
			"privacy.userContext.ui.enabled" = { Value = true; Status = "locked"; };
		};

		/* ---- EXTENSIONS ---- */
		# Check about:support for extension/add-on ID strings.
		# Valid strings for installation_mode are "allowed", "blocked",
		# "force_installed" and "normal_installed".
		ExtensionSettings = {
			# uBlock Origin:
			"uBlock0@raymondhill.net" = {
				install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
				installation_mode = "force_installed";
				private_browsing = true;
				blocked = false;
				};
		
		};
        	};
		};
}
