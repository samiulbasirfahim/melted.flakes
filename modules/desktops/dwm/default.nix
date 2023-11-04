{ pkgs, ... }: {
  imports = [ ./picom.nix ];
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
      dwmblocks = prev.dwmblocks.overrideAttrs (old: {
        src = /home/xenoxanite/suckless/dwmblocks;
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
      dwmblocks
      xorg.libXft
      xorg.libXinerama
      xwallpaper
      xdotool
      flameshot
      xclip
    ];
  };
}
