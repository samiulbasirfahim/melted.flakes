{
  programs.firefox.profiles.default.userContent = ''
    @-moz-document url(about:home),
    url(about:newtab),
    url(about:privatebrowsing){

    .click-target-container *,
    .top-sites-list * {
        color: #fff !important;
        text-shadow: 2px 2px 2px #34444b !important;
    }

    body::before {
        content: "";
        z-index: -1;
        position: fixed;
        top: 0;
        left: 0;
        background: #1f292d;
        background-size: cover;
        width: 100vw;
        height: 100vh;
    }

    main .logo-and-wordmark {
        display: none !important;
    }

    main button {
        border: 1px solid #DA4453 !important;
        border-radius: 50px !important;
        box-shadow: none !important;
        outline: none !important;
    }
    }
  '';
}
