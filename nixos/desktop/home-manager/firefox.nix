{ config, pkgs, ... }: 
{ 
  programs.firefox = { 
    enable = true; 
    languagePacks = [ "pt-BR" ];
    profiles."default" = {
      isDefault = true;
      userChrome = 
        ''@import "${pkgs.fetchFromGitHub {
          owner = "notawyvern";
          repo = "firefox-qutebrowser-userchrome";
          rev = "8f3d989089d1e0ec28008cef5aeb21b5dfa2b59c";
          sha256 = "sha256-0CG4JUCzLrUJK+21GCLGodKbHOFa7Tt1OF9ao2FLsSA=";
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
        "browser.startup.homepage" = { Value = "https://start.duckduckgo.com/"; Status = "locked"; };

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
