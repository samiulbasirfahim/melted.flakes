{ pkgs, config, ... }: {
  imports = [ (import ./userChrome.nix) ] ++ [ (import ./userContent.nix) ];

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
        FirefoxHome = {
          Search = false;
          Pocket = false;
          Snippets = false;
          TopSites = true;
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
        force = true;
        default = "DuckDuckGo";
        engines = {
          "Nix Packages" = {
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
              "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "Wikipedia".metaData.alias = "@wiki";
          "Google".metaData.alias = "@g";
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
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        sponsorblock
        youtube-shorts-block
        news-feed-eradicator
        bitwarden
        tridactyl
        languagetool
        darkreader
        videospeed
        pywalfox
        duckduckgo-privacy-essentials
      ];
    };
  };
  home.sessionVariables = { MOZ_DISABLE_CONTENT_SANDBOX = 1; };
}
