{ config, pkgs, ... }: 
{ 
  programs.firefox = { 
    enable = true; 
    languagePacks = [ "pt-BR" ];
    profiles."default" = {
      isDefault = true;
      userChrome = 
        ''@import "${pkgs.fetchFromGitHub {
          owner = "Dook97";
          repo = "firefox-qutebrowser-userchrome";
          rev = "7045b7bd819e9513188dc60346b973293b0ccf1c";
          sha256 = "sha256-KVVmgnaBu4x9aD93AeKKqlbdlj2cnL1bZqGt3Woj2hE=";
          }}/userChrome.css";
        '';
      };
    
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
        ProviderURL = "https://cloudflare-dns.com/dns-query";
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
        "browser.startup.homepage" = { Value = "moz-extension://59b7ba83-e9f1-4d55-83d7-c3d29c327c4f/static/newtab.html"; Status = "locked"; };

        # enables and enforces containers
        "privacy.userContext.enabled" = { Value = true; Status = "locked"; };
        "privacy.userContext.ui.enabled" = { Value = true; Status = "locked"; };

        # disable chatbot menu on left click
        "browser.ml.chat.menu" = { Value = false; Status = "locked"; };

        # allow userChrome.css to be read
        "toolkit.legacyUserProfileCustomizations.stylesheets" = { Value = true; Status = "locked"; };
      };

      /* ---- EXTENSIONS ---- */
      # Check about:support for extension/add-on ID strings.
      # Valid strings for installation_mode are "allowed", "blocked",
      # "force_installed" and "normal_installed".
      ExtensionSettings = {
        "*".installation_mode = "blocked"; # block extensions not declared

        # Vimium:
/*        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
          blocked = false;
        };
        */

        # tridactyl:
        "tridactyl.vim@cmcaine.co.uk" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl-vim/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
          blocked = false;
        };

        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
          blocked = false;
        };
        
        # Portuguese Brazilian dictionary:
        "pt-BR@dictionaries.addons.mozilla.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/corretor/latest.xpi";
          installation_mode = "force_installed";
          blocked = false;
        };
      };
    };
  };
}
