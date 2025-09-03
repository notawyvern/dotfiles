{ config, pkgs, ... }: 
{ 
  programs.qutebrowser = { 
    enable = true; 
    settings = {
      tabs.show = "multiple";
      
      fonts.default_family = "DepartureMono Nerd Font";
      fonts.default_size = "13pt";

      content.blocking.adblock.lists = [
        "https://easylist.to/easylist/easylist.txt"
        "https://easylist.to/easylist/easyprivacy.txt"
        "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext"
        "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt"
        "https://raw.githubusercontent.com/Spam404/lists/master/adblock-list.txt"
        "https://easylist-downloads.adblockplus.org/fanboy-notifications.txt"
        "https://raw.githubusercontent.com/bongochong/CombinedPrivacyBlockLists/master/MiniLists/cpbl-abp-mini.txt"
        "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"
        "https://easylist-downloads.adblockplus.org/fanboy-social.txt"
        "https://curben.gitlab.io/malware-filter/urlhaus-filter-online.txt"
        "https://gitcdn.xyz/repo/NanoAdblocker/NanoFilters/master/NanoMirror/NanoDefender.txt"
        "https://gitcdn.xyz/repo/NanoAdblocker/NanoFilters/master/NanoFilters/NanoBase.txt"
      ];
    };
    searchEngines = {
      aw = "https://wiki.archlinux.org/?search={}";
      yt = "https://inv.nadeko.net/search?q={}";
      leta = "https://leta.mullvad.net/search?q={}";
    };
    quickmarks = {
      # fun
      anibunker = "https://anibunker.com/";
      betteranime = "https://betteranime.net/";
      anroll = "https://www.anroll.net/";
      mal = "https://myanimelist.net/";
      mangafire = "https://mangafire.to/";

      # utils
      urlvoid = "https://www.urlvoid.com/";
      waybackmachine = "https://web.archive.org/";
      annaarchive = "https://annas-archive.li/";
      YOPmail = "https://yopmail.com/en/";
      chatgpt = "https://duck.ai/";
      meet = "https://meet.jit.si/";

      # personal
      facul-uni-estacio = "https://estudante.estacio.br/login";
      github = "https://github.com/";
      mail = "https://account.proton.me/mail";
      simplelogin = "https://app.simplelogin.io/auth/login";
      drive = "https://account.proton.me/drive";
    };
  };
}
