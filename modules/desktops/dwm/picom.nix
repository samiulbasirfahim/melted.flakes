{ pkgs, inputs, ... }: {
  home-manager.users.xenoxanite = {
    services.picom = {
      enable = true;
      package =
        inputs.nixpkgs-f2k.packages.${pkgs.system}.picom-ft-labs.overrideAttrs
        (o: {
          src = pkgs.fetchFromGitHub {
            owner = "fdev31";
            repo = "picom";
            rev = "7834dd3147ba605bba5cbe911bacfa8b217c37e0";
            hash = "sha256-fTMA4LgQ5aw4hnrKSIu74jxYDZpCgj0GmRZtOqQfjRU=";
          };
        }); # Override Picon Version
      extraArgs = [ "-experimental-backends" ];
      backend = "glx"; # Glx or Xrender
      vSync = true; # Fix Screen Tearing
      shadow = false; # Shadows
      fade = true;
      fadeDelta = 10;

      activeOpacity = 0.9; # Transparency
      inactiveOpacity = 0.9;
      menuOpacity = 0.9;

      settings = {
        daemon = true;
        use-damage = false; # Fixes Flickering
        resize-damage = 1;
        refresh-rate = 0;
        corner-radius = 0; # Corners
        round-borders = 5;
        # transition-length = 150; # Animations Jonaburg
        # transition-pow-x = 0.5;
        # transition-pow-y = 0.5;
        # transition-pow-w = 0.5;
        # transition-pow-h = 0.5;
        # size-transition = true;

        animations = true;
        animation-stiffness = 150;
        animation-window-mass = 3;
        animation-dampening = 21;
        animation-clamping = true;
        animation-mass = 1;
        animation-for-open-window = "zoom";
        animation-for-menu-window = "slide-down";
        animation-for-transient-window = "slide-down";
        animation-for-unmap-window = "slide-down"; # minimize window
        animation-for-prev-tag = "zoom";
        enable-fading-prev-tag = true;
        animation-for-next-tag = "zoom";
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
          strength = 3.0;
          size = 10;
          background = true;
          background-frame = false;
          background-fixed = false;
        };
      };
    };
  };
}
