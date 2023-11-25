{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    windowManager.dwm.enable = true;
    displayManager.startx.enable = true;
    deviceSection = ''Option "TearFree" "true"'';
  };
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        src = /home/xenoxanite/suckless/dwm;
        buildInputs = (old.buildInputs or [ ]) ++ [ pkgs.harfbuzz ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
      dmenu = prev.dmenu.overrideAttrs (old: {
        src = /home/xenoxanite/suckless/dmenu;
        buildInputs = (old.buildInputs or [ ]) ++ [ ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
      st = prev.dwmblocks.overrideAttrs (old: {
        src = /home/xenoxanite/suckless/st;
        buildInputs = (old.buildInputs or [ ]) ++ [ ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
    })
  ];
  home-manager.users.xenoxanite = {
    home.packages = with pkgs; [
      dwm
      dmenu
      st
      xorg.libXft
      xorg.libXinerama
      xwallpaper
      xdotool
      flameshot
      xclip
    ];
  };
}
