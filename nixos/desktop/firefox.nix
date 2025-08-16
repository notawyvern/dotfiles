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
      UserMessaging = { MoreFromMozilla = false; };
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DNSOverHTTPS = {
        Enabled = true;
        ProviderURL = "https://dns11.quad9.net/dns-query";
        Fallback = false;
        Locked = true;
      };
      DisablePocket = true;
      RequestedLocales = "pt-BR";
      HttpsOnlyMode = "force_enabled";
      SkipTermsOfUse = true;
      TranslateEnabled = false;
      DisableFirefoxAccounts = true;
      SearchEngines = { Default = "DuckDuckGo"; };
      DisableAccounts = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      SearchBar = "unified"; # alternative: "separate"
      SanitizeOnShutdown = {
        Cookies = true;
        Locked = true;	
      };
      FirefoxHome = {
        SponsoredTopSites = false;
        TopSites = false;
        Locked = true;
      };

      Preferences = {
        "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
        # enables and enforces containers
        "privacy.userContext.enabled" = { Value = true; Status = "locked"; };
        "privacy.userContext.ui.enabled" = { Value = true; Status = "locked"; };
      };

      /* ---- EXTENSIONS ---- */
      # Check about:support for extension/add-on ID strings.
      # Valid strings for installation_mode are "allowed", "blocked",
      # "force_installed" and "normal_installed".
      ExtensionSettings = {
        "*".installation_mode = "blocked"; # block extensions not declared

        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
          blocked = false;
        };
        
        # Portuguese Brazilian dictionary
        "pt-BR@dictionaries.addons.mozilla.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/corretor/latest.xpi";
          installation_mode = "force_installed";
          blocked = false;
        };
      };
    };
  };
}
