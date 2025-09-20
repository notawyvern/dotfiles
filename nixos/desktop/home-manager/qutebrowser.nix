{ config, pkgs, ... }: 
{ 
  programs.qutebrowser = { 
    enable = true; 
    settings = {
      
      # ui
      tabs.show = "multiple";
      url.default_page = "https://html.duckduckgo.com/";
      url.start_pages = "https://html.duckduckgo.com/";
      fonts.default_family = "DepartureMono Nerd Font";
      fonts.default_size = "13pt";

      # general
      content.headers.accept_language = "pt-BR,pt;q=0.9";

      content.blocking.adblock.lists = [
        # basics
        "https://easylist.to/easylist/easylist.txt"
        "https://easylist.to/easylist/easyprivacy.txt"
        "https://easylist-downloads.adblockplus.org/easylistportuguese.txt"

        # spam/ads
        "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
        "https://raw.githubusercontent.com/Yhonay/antipopads/master/hosts"
        "https://easylist-downloads.adblockplus.org/fanboy-notifications.txt"
        "https://raw.githubusercontent.com/Spam404/lists/master/adblock-list.txt"
        "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=adblockplus&showintro=0&mimetype=plaintext"
        "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt"
        "https://easylist-downloads.adblockplus.org/fanboy-social.txt"
        "https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt"
        "https://block.energized.pro/ultimate/formats/hosts.txt"
        "https://adaway.org/hosts.txt"

        # malware
        "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"
        "https://raw.githubusercontent.com/DandelionSprout/adfilt/refs/heads/master/Dandelion%20Sprout's%20Anti-Malware%20List.txt"
        "https://someonewhocares.org/hosts/zero/hosts"
        "https://raw.githubusercontent.com/bongochong/CombinedPrivacyBlockLists/master/MiniLists/cpbl-abp-mini.txt"
        "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn/hosts"
      ];
    };
    searchEngines = {
      DEFAULT = "https://html.duckduckgo.com/html/?q={}";
      brave = "https://search.brave.com/search?q={}";
      w = "https://pt.wikipedia.org/w/index.php?search={}";
      aw = "https://wiki.archlinux.org/?search={}";
      yt = "https://inv.nadeko.net/search?q={}";
      gg = "https://leta.mullvad.net/search?q={}&engine=google";
      sp = "https://www.startpage.com/sp/search?query={}";
      ddg = "https://duckduckgo.com/?q={}";
    };
    quickmarks = {
      # fun
      anibunker = "https://anibunker.com/";
      betteranime = "https://betteranime.net/";
      weebcentral = "https://weebcentral.com/";
      youtube = "https://inv.nadeko.net/";
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
