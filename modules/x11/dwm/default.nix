{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    windowManager.dwm.enable = true;
    displayManager.gdm.enable = true;
    deviceSection = ''Option "TearFree" "true"'';
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        src = /home/xenoxanite/.suckless/dwm;
        buildInputs = (old.buildInputs or [ ]) ++ [ pkgs.harfbuzz ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
      dmenu = prev.dmenu.overrideAttrs (old: {
        src = /home/xenoxanite/.suckless/dmenu;
        buildInputs = (old.buildInputs or [ ]) ++ [ ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
      st = prev.st.overrideAttrs (old: {
        src = /home/xenoxanite/.suckless/st;
        buildInputs = with pkgs;
          (old.buildInputs or [ ])
          ++ [ pkg-config xorg.libX11 xorg.libXft fontconfig harfbuzz gd glib ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
      /* dwmblocks = prev.dwmblocks.overrideAttrs (old: {
              src = /home/xenoxanite/.suckless/dwmblocks;
              buildInputs = (old.buildInputs or [ ]) ++ [ ];
              nativeBuildInputs = (old.nativeBuildInputs or [ ])
                ++ [ pkgs.pkg-config ];
            });
      */
    })

  ];
  home-manager.users.xenoxanite = {
    home.packages = with pkgs; [
      dwm
      dwmblocks
      dmenu
      st
      xwallpaper
      xcompmgr
      flameshot
      xclip
    ];
  };
}
