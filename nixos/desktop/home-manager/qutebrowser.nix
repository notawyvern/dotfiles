{ config, pkgs, ... }: 


  let
    homepage = (pkgs.fetchFromGitHub
    {
      owner = "notawyvern";
      repo = "startpage";
      rev = "e13a9710a96991a858276f33baeee9be889e892d";
      sha256 = "sha256-FeyJu2LK8QeoFmn3nhJGHMuuzGeiyd4C33P4wriWUIY=";
    } + "/index.html");
  in {

  programs.qutebrowser = { 
    enable = true; 
    settings = {
      
      # ui
      tabs.show = "multiple";
      url.default_page = homepage;
      url.start_pages = homepage;
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
      bv = "https://search.brave.com/search?q={}";
      w = "https://pt.wikipedia.org/w/index.php?search={}";
      aw = "https://wiki.archlinux.org/?search={}";
      yt = "https://inv.nadeko.net/search?q={}";
      ps = "https://presearch.com/search?q={}";
      gg = "https://www.startpage.com/sp/search?query={}";
      ddg = "https://duckduckgo.com/?q={}";
    };
    quickmarks = {
      # fun
      anibunker = "https://anibunker.com/";
      betteranime = "https://betteranime.net/";
      weebcentral = "https://weebcentral.com/";
      scrobble = "https://listenbrainz.org/";
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
      zapzap = "https://web.whatsapp.com/";
      email = "https://account.proton.me/mail";
      simplelogin = "https://app.simplelogin.io/auth/login";
      drive = "https://account.proton.me/drive";
    };
  };
}
