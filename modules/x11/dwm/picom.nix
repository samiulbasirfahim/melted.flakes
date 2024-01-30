{ pkgs, ... }: {
  home-manager.users.xenoxanite = {
    services.picom = {
      enable = true;
      package = pkgs.picom.overrideAttrs (o: {
        buildInputs = (o.buildInputs or [ ])
          ++ [ pkgs.pcre2 pkgs.xorg.xcbutil ];
        src = pkgs.fetchFromGitHub {
          owner = "fdev31";
          repo = "picom";
          rev = "7834dd3147ba605bba5cbe911bacfa8b217c37e0";
          hash = "sha256-fTMA4LgQ5aw4hnrKSIu74jxYDZpCgj0GmRZtOqQfjRU=";
        };
      }); # Override Picon Version
      settings = {
        daemon = true;
        use-damage = false; # Fixes Flickering
        resize-damage = 1;

        animations = true;
        animation-stiffness-in-tag = 175;
        animation-stiffness-tag-change = 175;

        animation-window-mass = 1;
        animation-dampening = 15;
        animation-clamping = true;

        animation-for-open-window = "zoom";
        animation-for-unmap-window = "zoom";
        animation-for-transient-window = "zoom";

        animation-for-prev-tag = "none";
        enable-fading-prev-tag = true;
        animation-for-next-tag = "none";
        enable-fading-next-tag = true;

        fading = true;
        fade-in-step = 0.1;
        fade-out-step = 7.0e-2;

        corner-radius = 0;
        shadow = false;

        inactive-opacity = 0.94;
        active-opacity = 0.94;
        fullscreen-opacity = 1;
        frame-opacity = 1;
        inactive-opacity-override = false;
        inactive-dim = 0.1;
        opacityRules =
          [ "100:_NET_WM_STATE@[0]:32a = '_NET_WM_STATE_FULLSCREEN'" ];

        focusExclude = [
          "class_g = 'Cairo-clock'"
          "class_g = 'gcolor3'"
          "class_g = 'slop'" # maim
        ];

        blur-method = "dual_kawase";
        blur-size = 10;
        blur-background = true;
        blur-background-frame = true;
        blur-kern = "3x3box";
        blur-background-exclude = [
          "window_type = 'dock'"
          "window_type = 'desktop'"
          "_GTK_FRAME_EXTENTS@:c"
          "class_g = 'slop'"
          "_NET_WM_STATE@:32a = '_NET_WM_STATE_FULLSCREEN'"
        ];

        backend = "glx";

        vsync = true;
        mark-wmwin-focused = true;
        mark-ovredir-focused = true;
        detect-rounded-corners = true;
        detect-client-opacity = true;
        refresh-rate = 0;
        detect-transient = true;
        detect-client-leader = true;
        log-level = "info";

        wintypes = {
          normal = { };
          desktop = { };
          tooltip = {
            shadow = true;
            opacity = 1;
            focus = true;
            full-shadow = false;
          };
          dock = { };
          dnd = { shadow = false; };
          splash = { };
          popup_menu = { opacity = 1; };
          dropdown_menu = { opacity = 1; };
          utility = { };
        };
      };
    };
  };
}
