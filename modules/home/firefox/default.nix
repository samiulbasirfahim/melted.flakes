{ pkgs, ... }: {
  imports = [ ./userContent.nix ./userChrome.nix ];

  programs.firefox = {
    enable = true;

    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        Cookies = { RejectTracker = true; };
        FirefoxHome = {
          Search = true;
          Pocket = false;
          SponsoredTopSites = false;
          SponsoredPocket = false;
          Snippets = false;
          TopSites = false;
          Highlights = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };
    profiles.default = {
      id = 0;
      name = "xenoxanite";
      search = {
        default = "DuckDuckGo";
        force = true;
        engines = {
          "NixOS Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }];
            icon =
              "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "Home-Manager Options" = {
            urls = [{
              template =
                "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";
            }];
            icon =
              "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@hm" ];
          };
          "Wikipedia".metaData.alias = "@wk";
          "Google".metaData.hidden = true;
          "Amazon.com".metaData.hidden = true;
          "Bing".metaData.hidden = true;
          "eBay".metaData.hidden = true;
        };
      };
      settings = {
        "general.smoothScroll" = true;
        "browser.toolbars.bookmarks.visibility" = "never";
        "privacy.webrtc.legacyGlobalIndicator" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "gfx.webrender.all" = true;
        "svg.context-properties.content.enabled" = true;
        "browser.compactmode.show" = true;
        "browser.search.region" = "us";
        "distribution.searchplugins.defaultLocale" = "en-US";
        "general.useragent.locale" = "en-US";
        "privacy.donottrackheader.enabled" = true;
        "browser.startup.page" = 3;
        "browser.sessionstore.resume_from_crash" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.purge_trackers.enabled" = true;
        "media.peerconnection.ice.default_address_only" = true;
        "media.peerconnection.enabled" = true;
        "toolkit.telemetry.enabled" = false;
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        youtube-shorts-block
        vimium
        languagetool
        darkreader
        videospeed
        pywalfox
      ];
    };
  };
  home.sessionVariables = { MOZ_DISABLE_CONTENT_SANDBOX = 1; };
}
