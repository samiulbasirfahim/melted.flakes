{ pkgs, ... }: {
  imports = [ ./userChrome-pywal.nix ];
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

      enableArkenfoxUserjs = true;
      ExtensionSettings = {
        "ebay@search.mozilla.org".installation_mode = "blocked";
        "amazondotcom@search.mozilla.org".installation_mode = "blocked";
        "google@search.mozilla.org".installation_mode = "blocked";
        "bing@search.mozilla.org".installation_mode = "blocked";
        "wikipedia@search.mozilla.org".installation_mode = "blocked";
      };
    };
    profiles.default = {
      name = "xenoxanite";
      search = {
        engines = {
          "Bing".metaData.hidden = true;
          "Amazon".metaData.hidden = true;
          "Amazon.ca".metaData.hidden = true;
          "Google".metaData.hidden = true;
          "eBay".metaData.hidden = true;
          "Wikipedia".metaData.hidden = true;

          "DuckDuckGo".metaData.alias = "@d";

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
        force = true;
        default = "DuckDuckGo";
        order = [ "DuckDuckGo" "Nix Packages" ];
      };

      settings = {
        "browser.compactmode.show" = true;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.fullscreen.autohide" = false;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.hardware-video-decoding.force-enabled" = true;
        "general.smoothScroll.msdPhysics.enabled" = true;
        "layout.frame_rate" = 75;
        "layout.css.backdrop-filter.enabled" = true;
        "layout.css.devPixelsPerPx" = "-1.0";
        "devtools.debugger.remote-enabled" = true;
        "devtools.chrome.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.newtabpage.enabled" = false;
        # enable HTTPS-Only Mode
        "dom.security.https_only_mode_ever_enabled" = true;
        # Privacy Settings
        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.partition.network_state.ocsp_cache" = true;
        # Disable all sorts of telemetry
        # As well as Firefox 'experiments'
        "experiments.activeExperiment" = false;
        "experiments.enabled" = false;
        "experiments.supported" = false;
        "network.allow-experiments" = false;
        # Disable Pocket Integration
        "browser.newtabpage.activity-stream.section.highlights.includePocket" =
          false;
        "extensions.pocket.enabled" = false;
        "extensions.pocket.api" = "";
        "extensions.pocket.oAuthConsumerKey" = "";
        "extensions.pocket.showHome" = false;
        "extensions.pocket.site" = "";
        # Arkenfox stuff
        # https://github.com/arkenfox/user.js/wiki/
        "browser.aboutConfig.showWarning" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.startup.page" = 1;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";
        "geo.provider.use_corelocation" = false;
        "geo.provider.use_gpsd" = false;
        "geo.provider.use_geoclue" = false;
        "geo.enabled" = false;
        "browser.region.network.url" = "";
        "browser.region.update.enabled" = false;
        "intl.accept_languages" = "en-US, en";
        "javascript.use_us_english_locale" = true;
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.discovery.enabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "data: =";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.ping-centre.telemetry" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
        "captivedetect.canonicalURL" = "";
        "network.captive-portal-service.enabled" = false;
        "network.connectivity-service.enabled" = false;
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "network.prefetch-next" = false;
        "network.dns.disablePrefetch" = true;
        "network.predictor.enabled" = false;
        "network.predictor.enable-prefetch" = false;
        "network.http.speculative-parallel-limit" = 0;
        "browser.places.speculativeConnect.enabled" = false;
        "network.dns.disableIPv6" = true;
        "network.proxy.socks_remote_dns" = true;
        "network.file.disable_unc_paths" = true;
        "network.gio.supported-protocols" = "";
        "keyword.enabled" = true;
        "browser.fixup.alternate.enabled" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.urlbar.dnsResolveSingleWordsAfterSearch" = 0;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.formfill.enable" = false;
        "signon.autofillForms" = false;
        "signon.formlessCapture.enabled" = false;
        "network.auth.subresource-http-auth-allow" = 1;
        "browser.cache.disk.enable" = false;
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "media.memory_cache_max_size" = 65536;
        "browser.sessionstore.privacy_level" = 2;
        "toolkit.winRegisterApplicationRestart" = false;
        "browser.shell.shortcutFavicons" = false;
        "security.ssl.require_safe_negotiation" = false;
        "security.tls.enable_0rtt_data" = false;
        "security.OCSP.enabled" = 1;
        "security.OCSP.require" = true;
        "security.family_safety.mode" = 0;
        "security.cert_pinning.enforcement_level" = 2;
        "security.remote_settings.crlite_filters.enabled" = true;
        "security.pki.crlite_mode" = 2;
        "security.mixed_content.block_display_content" = true;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_send_http_background_request" = false;
        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "browser.ssl_override_behavior" = 1;
        "browser.xul.error_pages.expert_bad_cert" = true;
        "network.http.referer.XOriginPolicy" = 0;
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
        "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
        "media.peerconnection.ice.default_address_only" = true;
        "media.eme.enabled" = true;
        "dom.disable_beforeunload" = true;
        "dom.disable_window_move_resize" = true;
        "dom.disable_open_during_load" = true;
        "dom.popup_allowed_events" = "click dblclick mousedown pointerdown";
        "accessibility.force_disabled" = 1;
        "beacon.enabled" = false;
        "browser.helperApps.deleteTempFileOnExit" = true;
        "browser.pagethumbnails.capturing_disabled" = true;
        "browser.uitour.enabled" = false;
        "browser.uitour.url" = "";
        "middlemouse.contentLoadURL" = false;
        "permissions.manager.defaultsUrl" = "";
        "webchannel.allowObject.urlWhitelist" = "";
        "network.IDN_show_punycode" = true;
        "pdfjs.disabled" = false;
        "pdfjs.enableScripting" = false;
        "network.protocol-handler.external.ms-windows-store" = false;
        "permissions.delegation.enabled" = false;
        "browser.download.useDownloadDir" = true;
        "browser.download.alwaysOpenPanel" = false;
        "browser.download.manager.addToRecentDocs" = false;
        "browser.download.always_ask_before_handling_new_types" = true;
        "extensions.enabledScopes" = 5;
        "extensions.autoDisableScopes" = 15;
        "extensions.postDownloadThirdPartyPrompt" = false;
        "browser.contentblocking.category" = "strict";
        "privacy.partition.serviceWorkers" = true;
        "privacy.partition.always_partition_third_party_non_cookie_storage" =
          true;
        "privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage" =
          false;
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "privacy.clearOnShutdown.cache" = false;
        "privacy.clearOnShutdown.downloads" = false;
        "privacy.clearOnShutdown.formdata" = true;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.sessions" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.offlineApps" = true;
        "privacy.cpd.cache" = true;
        "privacy.cpd.formdata" = true;
        "privacy.cpd.history" = true;
        "privacy.cpd.sessions" = true;
        "privacy.cpd.offlineApps" = false;
        "privacy.cpd.cookies" = false;
        "privacy.sanitize.timeSpan" = 0;
        "privacy.resistFingerprinting" = true;
        "widget.non-native-theme.enabled" = true;
        "browser.link.open_newwindow" = 3;
        "browser.link.open_newwindow.restriction" = 0;
        "webgl.disabled" = false;
        "extensions.blocklist.enabled" = true;
        "network.http.referer.spoofSource" = false;
        "security.dialog_enable_delay" = 1000;
        "privacy.firstparty.isolate" = false;
        "extensions.webcompat.enable_shims" = true;
        "security.tls.version.enable-deprecated" = false;
        "extensions.webcompat-reporter.enabled" = false;
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.startup.homepage" = "chrome://browser/content/blanktab.html";
        "browser.messaging-system.whatsNewPanel.enabled" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" =
          false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" =
          false;
        "browser.urlbar.suggest.quicksuggest" = false;
        "app.update.background.scheduling.enabled" = false;
        "security.csp.enable" = true;
        "security.ask_for_password" = 2;
        "security.password_lifetime" = 5;
        "dom.storage.next_gen" = true;
        "network.cookie.lifetimePolicy" = 0;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "browser.crashReports.unsubmittedCheck.enabled" = false;
        # Don't ask for saving passwords
        "signon.rememberSignons" = false;
        # Hide 'Firefox View'
        "browser.tabs.firefox-view" = false;
        # Compact mode
        # Dark theme
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

        # Default to dark theme in DevTools panel
        "devtools.theme" = "dark";
        "app.update.auto" = false;
        "app.update.service.enabled" = false;
        # Enable ETP for decent security (makes firefox containers and many
        # common security/privacy add-ons redundant).
        "privacy.donottrackheader.value" = 1;
        "privacy.purge_trackers.enabled" = true;
        "browser.search.region" = "CA";
        "browser.search.countryCode" = "CA";
        "browser.search.isUS" = false;
        "browser.ctrlTab.recentlyUsedOrder" = false;
        "browser.bookmarks.showMobileBookmarks" = true;
        "browser.uidensity" = 1;
        "browser.urlbar.placeholderName" = "DuckDuckGo";
        "browser.urlbar.update1" = true;
        "distribution.searchplugins.defaultLocale" = "en-CA";
        "general.useragent.locale" = "en-CA";
        "identity.fxaccounts.account.device.name" = "xenoxanite";
        "privacy.trackingprotection.socialtracking.annotate.enabled" = true;
        "reader.color_scheme" = "sepia";
        "services.sync.declinedEngines" = "addons,passwords,prefs";
        "services.sync.engine.addons" = false;
        "services.sync.engineStatusChanged.addons" = true;
        "services.sync.engine.passwords" = false;
        "services.sync.engine.prefs" = false;
        "services.sync.engineStatusChanged.prefs" = true;
        "services.sync.prefs.sync.browser.uiCustomization.state" = true;
        "browser.urlbar.shortcuts.bookmarks" = false;
        "browser.urlbar.shortcuts.history" = false;
        "browser.urlbar.shortcuts.tabs" = false;
        "browser.urlbar.showSearchSuggestionsFirst" = false;
        "browser.newtabpage.activity-stream.enabled" = false;
        "browser.newtabpage.enhanced" = false;
        "browser.newtabpage.introShown" = true;
        "browser.newtab.preload" = false;
        "browser.newtabpage.directory.ping" = "";
        "browser.urlbar.trimURLs" = false;
        "browser.disableResetPrompt" =
          true; # "Looks like you haven't started Firefox in a while."
        "browser.onboarding.enabled" =
          false; # "New to Firefox? Let's get started!" tour
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
        "extensions.shield-recipe-client.enabled" = false;
        "reader.parse-on-load.enabled" = false; # "reader view"
        "security.pki.sha1_enforcement_level" = 1;
        "geo.provider.network.url" =
          "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr" = false;
        "extensions.htmlaboutaddons.discover.enabled" = false;
        "browser.sessionstore.interval" = "1800000";
        "dom.battery.enabled" = false;
        "browser.send_pings" = false;
        "dom.gamepad.enabled" = false;
        "datareporting.healthreport.service.enabled" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.available" = "off";
        "extensions.formautofill.creditCards.available" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "extensions.formautofill.heuristics.enabled" = false;

        "ui.systemUsesDarkTheme" = 1;
        "font.name.serif.x-western" = "MonoLisa Custom";

        # Firefox hardening using preferences (automated)
        "app.normandy.first_run" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "doh-rollout.disable-heuristics" = true;
        "dom.forms.autocomplete.formautofill" = true;
        "identity.fxaccounts.enabled" = false;
        "layout.spellcheckDefault" =
          1; # Used to disable spellchecker… set to `0` for increased privacy
        "network.cookie.cookieBehavior" = 1;
        "network.trr.mode" = 5;
        "places.history.enabled" = false;
        "privacy.history.custom" = true;
        "signon.management.page.breach-alerts.enabled" = false;

        # GeoLocation
        "geo.provider.ms-windows-location" = false;

        # Disable extension recommendations
        "browser.shopping.experience2023.enabled" = false;

        # Disable telemetry
        "browser.urlbar.search.suggest.enabled" = false;
        "browser.urlbar.trending.featureGate" = false;
        "browser.urlbar.addons.featureGate" = false;
        "browser.urlbar.mdn.featureGate" = false;
        "browser.urlbar.pocket.featureGate" = false;
        "browser.urlbar.weather.featureGate" = false;

        # Seperate Private Search Engines
        "browser.search.separatePrivateDefault" = true;
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        "dom.scurity.https_only_mode_send_http_background_request" = false;

        # Downloads
        # "browser.download.useDownloadDir" = false; # This can be annoying
        "browses.download.alwaysOpenPanel" = false;
        # "browser.download.always_ask_before_handling_new_types" = false; # This can be annoying

        "browser.urlbar.showSearchTerms.enabled" = false;
        "gfx.webrender.all" = true; # Enforce hardware WebRender (Default false)
        "media.av1.enabled" =
          true; # Enable AV1 Decoding (already assumming new enough hardware) (Default true)
        "gfx.x11-egl.force-enabled" =
          true; # Enforce the EGL backend (Default false)
        "widget.dmabuf.force-enabled" = true; # Enforce DMABUF (Default false)

        # Fonts
        # From Firefox Arch Wiki: https://wiki.archlinux.org/title/Firefox#Font_troubleshooting
        "gfx.font_rendering.fontconfig.max_generic_substitutions" =
          127; # Increase the maximum number of generic substitutions (127 is the highest possible value)
        "font.name-list.emoji" = "emoji"; # Use system emoji font
        "gfx.font_rendering.opentype_svg.enabled" =
          false; # Prevent Mozilla font from interfering with system emoji font

        "layout.css.has-selector.enabled" = true;

        # Misc
        "accessibility.blockautorefresh" = true;
        "accessibility.typeaheadfind.enablesound" = false;
        "accessibility.typeaheadfind.flashBar" = 0;
        "browser.chrome.toolbar_tips" = false;
        "browser.newtabpage.activity-stream.discoverystream.enabled" = false;
        "browser.newtabpage.activity-stream.topSitesRows" = 3;
        "font.default.x-western" = "sans-serif";
        "privacy.userContext.extension" = "@contain-facebook";
        "network.trr.custom_uri" = "https://dns.quad9.net/dns-query";
        "network.trr.uri" = "https://dns.quad9.net/dns-query";
        # Restore previous session
        "browser.sessionstore.restore_on_demand" = true;
        "devtools.dom.enabled" = true;
        "devtools.toolbox.host" = "right";
        "widget.use-xdg-desktop-portal" = true;
        "privacy.popups.disable_from_plugins" = 1;
        "browser.backspace_action" = 1;
        "browser.cache.disk.parent_directory" = "/run/user/1000/firefox";
        "browser.safebrowsing.malware.enabled" = false;
        "browser.safebrowsing.phishing.enabled" = false;
        "dom.event.clipboardevents.enabled" = false;
        "geo.wifi.uri" =
          "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
        "network.http.sendSecureXSiteReferrer" = false;
        "device.sensors.ambientLight.enabled" = false; # default
        "browser.newtabpage.activity-stream.feeds.snippets" = false; # default
        "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
        "captivedetect.canonicalContent" = "";
        "security.cert_pinning.enforcement_leve" = 2;
        "security.insecure_connection_text.enabled" = true;
        "media.autoplay.blocking_policy" = 1;
        "dom.allow_cut_copy" = false;
        "dom.vibrator.enabled" = false;
        "javascript.options.asmjs" = false;
        "dom.vr.enabled" = false; # default
        "permissions.default.xr" = 2; # default = 0
        "browser.tabs.warnOnClose" = false;
        "general.autoScroll" = true;
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        i-dont-care-about-cookies
        ublock-origin
        vimium-c
        darkreader
        videospeed
        pywalfox
        df-youtube
      ];
    };
  };
  home.sessionVariables = { MOZ_DISABLE_CONTENT_SANDBOX = 1; };
}
