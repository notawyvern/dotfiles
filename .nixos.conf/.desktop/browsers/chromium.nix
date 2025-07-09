{ config, pkgs, ... }:

{

  programs.chromium = {
	enable = true;
	extensions = [ "ddkjiahejlhfcafbddmgiahcphecmpfh" /* ublock origin lite */ ];
	initialPrefs = {
		"sync_promo" = [ 
			"show_on_first_run_allowed" false
			];
		"distribution" = [
			"make_chrome_default" false
			"make_chrome_default_for_user" false
			];
			};
	extraOpts = {
		"SpellcheckEnabled" = true;
		"SpellcheckLanguage" = [ "pt-BR" ];

		# tweaks

		"PasswordSharingEnabled" = false;
		"PasswordLeakDetectionEnabled" = false;
		"SafeBrowsingExtendedReportingEnabled" = false;
		"SafeBrowsingSurveysEnabled" = false;
		"SafeBrowsingDeepScanningEnabled" = false;
		"AlternateErrorPagesEnabled" = false;
		"AutofillCreditCardEnabled" = false;
		"BackgroundModeEnabled" = false;
		"BrowserGuestModeEnabled" = false;
		"BrowserSignin" = 0;
		"BuiltInDnsClientEnabled" = false;
		"DefaultBrowserSettingEnabled" = false;
		"MetricsReportingEnabled" = false;
		"RelatedWebsiteSetsEnabled" = false;
		"DnsOverHttpsMode" = "automatic";
		"DnsOverHttpsTemplates" = "https://security.cloudflare-dns.com/dns-query";
		"HttpsOnlyMode" = "force_enabled";
		"ShoppingListEnabled" = false;
		"SyncDisabled" = true;

		};
		};

	environment.systemPackages = [ pkgs.chromium ];
	
}
