{
  programs.firefox.profiles.default.userContent = ''


    @-moz-document url(about:blank), url(about:newtab), url(about:home) {
      body {
        --newtab-snippets-background-color: #242931 !important;
        --newtab-contextmenu-button-color: #101419 !important;
        --newtab-contextmenu-background-color: #242931 !important;

        /* Firefox 89 */
        --newtab-topsites-background-color: #242931 !important;
        --newtab-textbox-background-color: #242931 !important;
        --customize-menu-background: #242931 !important;
        --customize-menu-secondary-action-background: #101419 !important;
        --customize-menu-secondary-action-background-hover: #101419 !important;
        --newtab-primary-action-background: #70a5eb !important;
        --newtab-primary-action-background-off: #101419 !important;
        --customize-menu-line-color: #70a5eb !important;
        --newtab-background-button-color: #242931 !important;
        --newtab-background-button-hover-color: #242931 !important;
      }

      /* Add bold text to most text */
      .top-site-outer .title span,
      .top-site-outer .default-icon[data-fallback]::before,
      .top-site-outer .search-topsite[data-fallback]::before,
      .context-menu > ul > li > a,
      .top-site-outer .default-icon,
      .top-site-outer .search-topsite {
        font-weight: bold !important;
        font-size: 12px;
      }

      /* Bold text to activity card page labels */
      .ds-highlights .section .section-list .card-outer .card-host-name {
        font-weight: bold;
      }

      /* Remove box shadow border from top sites cards */
      .top-site-outer .tile {
        box-shadow: none !important;
      }

      /* Highlights card image placeholder */
      [lwt-newtab-brighttext] .card-outer .card-preview-image-outer {
        background-color: #70a5eb !important;
      }

      /* Top sites card hover border */
      [lwt-newtab-brighttext]
        .ds-top-sites
        .top-sites
        .top-site-outer
        .top-site-inner
        > a:-moz-any(:hover)
        .tile {
        box-shadow: 0 0 0 3px #242931 !important;
      }

      /* Clock icon in new tab highlight cards */
      [lwt-newtab-brighttext] .card > .card-details > .card-context {
        clip-path: none !important;
        background-color: #242931 !important;
      }

      /* "Highlights" domain name */
      .card-outer .card-host-name {
        color: #70a5eb !important;
      }

      /* "Highlights" context icon */
      .card-outer .card-context-icon {
        fill: #70a5eb !important;
      }

      /* "Top sites" and "Highlights" titles */
      .ds-header,
      .ds-layout .section-title span {
        color: var(--newtab-text-primary-color) !important;
      }

      /* "Top sites" and "Highlights" icons */
      .ds-header .icon,
      .ds-layout .section-title span .icon {
        fill: var(--newtab-text-primary-color) !important;
      }

      /* Change card and search input background color based for dark mode */
      [lwt-newtab-brighttext] .trailheadCard,
      [lwt-newtab-brighttext] .search-wrapper input,
      [lwt-newtab-brighttext] .top-site-outer .top-site-icon,
      [lwt-newtab-brighttext] .ds-highlights .section .section-list .card-outer {
        background-color: #242931 !important;
      }

      /* Card border when hovering in dark mode */
      [lwt-newtab-brighttext]
        .card-outer:-moz-any(:hover, :focus, .active):not(.placeholder) {
        box-shadow: 0 0 0 5px #242931 !important;
      }

      /* Card border when hovering in light mode */
      .card-outer:-moz-any(:hover, :focus, .active):not(.placeholder) {
        box-shadow: 0 0 0 5px white !important;
      }

      /* Change and search input background color for light mode */
      .trailheadCard,
      .search-wrapper input,
      .top-site-outer .top-site-icon,
      .ds-highlights .section .section-list .card-outer {
        background-color: white !important;
      }

      /* Hides the active background of a section when opening a context menu */
      .collapsible-section.active {
        background: none !important;
      }

      .personalize-button:hover,
      .customize-menu .close-button:hover {
        filter: brightness(80%);
      }

      [lwt-newtab-brighttext] .personalize-button:hover,
      [lwt-newtab-brighttext] .customize-menu .close-button:hover {
        filter: brightness(120%);
      }
    }

    @-moz-document url(about:home),
          url(about:newtab),
          url(about:privatebrowsing) {
      .click-target-container *,
      .top-sites-list * {
        color: var(--foreground) !important;
        text-shadow: 2px 2px 2px var(--background) !important;
      }

      body::before {
        content: "";
        z-index: -1;
        position: fixed;
        top: 0;
        left: 0;
        background: var(--background);
        background-size: cover;
        width: 100vw;
        height: 100vh;
      }

      main .logo-and-wordmark {
        display: none !important;
      }

      main button {
        border: 2px solid var(--color2) !important;
        border-radius: 50px !important;
        box-shadow: none !important;
        outline: none !important;
      }
    }

  '';
}
