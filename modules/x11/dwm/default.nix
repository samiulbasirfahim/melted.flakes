{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    windowManager.dwm.enable = true;
    displayManager.startx.enable = true;
    videoDrivers = [ "amdgpu" ];
    deviceSection = ''Option "TearFree" "true"'';
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal ];
    config.common.default = "*";
  };
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        src = /home/fahim/.suckless/dwm;
        buildInputs = (old.buildInputs or [ ]) ++ [ pkgs.imlib2 ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
      dmenu = prev.dmenu.overrideAttrs (old: {
        src = /home/fahim/.suckless/dmenu;
        buildInputs = (old.buildInputs or [ ]) ++ [ ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
      st = prev.st.overrideAttrs (old: {
        src = /home/fahim/.suckless/st;
        buildInputs = with pkgs;
          (old.buildInputs or [ ])
          ++ [ pkg-config xorg.libX11 xorg.libXft fontconfig harfbuzz gd glib ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
      dwmblocks = prev.dwmblocks.overrideAttrs (old: {
        src = /home/fahim/.suckless/dwmblocks;
        buildInputs = (old.buildInputs or [ ]) ++ [ ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
    })
  ];
  home-manager.users.fahim = {
    home.packages = with pkgs; [
      dwmblocks
      dmenu
      xdotool
      st
      xwallpaper
      xcompmgr
      flameshot
      xclip
      copyq
      betterlockscreen
      xautolock
    ];
  };
}
