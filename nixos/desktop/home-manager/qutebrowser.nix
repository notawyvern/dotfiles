{ config, pkgs, ... }: 
{ 
  programs.qutebrowser = { 
    enable = true; 
    settings = {
      tabs.show = "multiple";
      content.headers.accept_language = "pt-BR,pt;q=0.9";
      
      fonts.default_family = "DepartureMono Nerd Font";
      fonts.default_size = "13pt";

      content.blocking.adblock.lists = [
        # basics
        "https://easylist.to/easylist/easylist.txt"
        "https://easylist.to/easylist/easyprivacy.txt"
        "https://easylist-downloads.adblockplus.org/easylistportuguese.txt"

        # coin-mining
        "https://zerodot1.gitlab.io/CoinBlockerLists/list.txt"
        "https://gitlab.com/ZeroDot1/CoinBlockerLists/-/raw/master/list_browser.txt"
        "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"

        # spam/ads
        "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
        "https://raw.githubusercontent.com/Yhonay/antipopads/master/hosts"
        "https://easylist-downloads.adblockplus.org/fanboy-notifications.txt"
        "https://raw.githubusercontent.com/Spam404/lists/master/adblock-list.txt"
        "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext"
        "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt"
        "https://easylist-downloads.adblockplus.org/fanboy-social.txt"

        # mainly malware
        "https://someonewhocares.org/hosts/zero/hosts"
        "https://raw.githubusercontent.com/bongochong/CombinedPrivacyBlockLists/master/MiniLists/cpbl-abp-mini.txt"
        "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn/hosts"
      ];
    };
    searchEngines = {
      w = "https://pt.wikipedia.org/w/index.php?search={}";
      aw = "https://wiki.archlinux.org/?search={}";
      yt = "https://inv.nadeko.net/search?q={}";
      gg = "https://leta.mullvad.net/search?q={}&engine=google";
      brave = "https://search.brave.com/search?q={}";
    };
    quickmarks = {
      # fun
      anibunker = "https://anibunker.com/";
      betteranime = "https://betteranime.net/";
      mal = "https://myanimelist.net/animelist/weeabotaku";
      mangafire = "https://mangafire.to/";

      # utils
      urlvoid = "https://www.urlvoid.com/";
      waybackmachine = "https://web.archive.org/";
      annaarchive = "https://annas-archive.li/";
      YOPmail = "https://yopmail.com/en/";
      chatgpt = "https://duck.ai/";
      mynixos = "https://mynixos.com/";
      meet = "https://meet.jit.si/";

      # personal
      facul-uni-estacio = "https://estudante.estacio.br/login";
      github = "https://github.com/";
      email = "https://account.proton.me/mail";
      simplelogin = "https://app.simplelogin.io/auth/login";
      drive = "https://account.proton.me/drive";
    };
  };
}
