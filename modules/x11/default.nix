{
  imports = [ ./dwm ./dunst ];
  home-manager.users.fahim = { pkgs, ... }: {
    services.picom = {
      enable = true;
      package = pkgs.picom.overrideAttrs (o: {
        buildInputs = (o.buildInputs or [ ])
          ++ [ pkgs.pcre2 pkgs.xorg.xcbutil ];
        src = pkgs.fetchFromGitHub {
          owner = "fdev32";
          repo = "picom";
          rev = "7834dd3147ba605bba5cbe911bacfa8b217c37e0";
          hash = "sha256-fTMA4LgQ5aw4hnrKSIu74jxYDZpCgj0GmRZtOqQfjRU=";
        };

      });
      extraArgs = [ "-experimental-backends" ];
      backend = "glx"; # Glx or Xrender
      vSync = true; # Fix Screen Tearing
      shadow = false; # Shadows
      fade = true;
      fadeDelta = 5;
      activeOpacity = 0.92; # Transparency
      inactiveOpacity = 0.92;
      menuOpacity = 0.92;
      opacityRules =
        [ "100:_NET_WM_STATE@[0]:32a = '_NET_WM_STATE_FULLSCREEN'" ];
      settings = {
        daemon = true;
        use-damage = false; # Fixes Flickering
        resize-damage = 1;
        refresh-rate = 0;
        corner-radius = 0; # Corners
        round-borders = 0;
        animations = true;
        animation-stiffness = 5;
        animation-window-mass = 5;
        animation-dampening = 5;
        animation-clamping = true;
        animation-mass = 5;
        animation-for-open-window = "slide-down";
        animation-for-menu-window = "slide-down";
        animation-for-transient-window = "slide-down";
        animation-for-unmap-window = "slide-down"; # minimize window
        animation-for-prev-tag = "slide-down";
        enable-fading-prev-tag = true;
        animation-for-next-tag = "slide-down";
        enable-fading-next-tag = true;
        animation-for-workspace-switch-in =
          "zoom"; # the windows in the workspace that is coming in
        animation-for-workspace-switch-out =
          "zoom"; # the windows in the workspace that are coming out
        detect-rounded-corners = true; # Extras
        detect-client-opacity = false;
        detect-transient = true;
        detect-client-leader = false;
        mark-wmwim-focused = true;
        mark-ovredir-focues = true;
        unredir-if-possible = true;
        glx-no-stencil = true;
        glx-no-rebind-pixmap = true;
        blur = {
          method = "dual_kawase";
          strength = 4.0;
          size = 8;
          background = true;
          background-frame = true;
          background-fixed = false;
        };
      };
    };
  };

}
