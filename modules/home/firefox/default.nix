{ pkgs, ... }: {
  imports = [ ./userContent.nix ./userChrome.nix ];
  programs.firefox = {
    enable = true;
    policies = {
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
        Search = false;
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
      DisableFormHistory = true;
      DontCheckDefaultBrowser = true;

      ExtensionSettings = {
        "ebay@search.mozilla.org".installation_mode = "blocked";
        "amazondotcom@search.mozilla.org".installation_mode = "blocked";
        "bing@search.mozilla.org".installation_mode = "blocked";
        "ddg@search.mozilla.org".installation_mode = "blocked";
        "wikipedia@search.mozilla.org".installation_mode = "blocked";
      };
      Preferences = { };

    };
    package = pkgs.firefox-beta;
    profiles.default = {
      name = "xenoxanite";
      search = {
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
              "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
        };
        default = "DuckDuckGo";
        force = true;
        order = [ "DuckDuckGo" ];
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        youtube-shorts-block
        vimium-c
        news-feed-eradicator
        languagetool
        darkreader
        videospeed
      ];
    };
  };
  home.sessionVariables = { MOZ_DISABLE_CONTENT_SANDBOX = 1; };
}
