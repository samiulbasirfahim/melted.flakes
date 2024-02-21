{ pkgs, user, ... }: {

  services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs (old: {
    # src = pkgs.fetchFromGitHub {
    #   owner = "xenoxanite";
    #   repo = "dwm";
    #   rev = "main";
    #   hash = "sha256-cmjJWV7SjH6XEtlxa5nA546AyeA3yUafQLtpoUQeX/8=";
    # };
    src = /home/${user}/.suckless/dwm;
    buildInputs = (old.buildInputs or [ ]) ++ [ pkgs.imlib2 ];
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ pkgs.pkg-config ];
  });

  nixpkgs.overlays = [
    (final: prev: {
      st = prev.st.overrideAttrs (old: {
        src = /home/${user}/.suckless/st;
        buildInputs = with pkgs;
          (old.buildInputs or [ ])
          ++ [ pkg-config xorg.libX11 xorg.libXft fontconfig harfbuzz gd glib ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
      dwmblocks = prev.dwmblocks.overrideAttrs (old: {
        src = /home/${user}/.suckless/dwmblocks;
        buildInputs = old.buildInputs or [ ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });

      dmenu  = prev.dmenu.overrideAttrs (old: {
        src = /home/${user}/.suckless/dmenu;
        buildInputs = old.buildInputs or [ ];
        nativeBuildInputs = (old.nativeBuildInputs or [ ])
          ++ [ pkgs.pkg-config ];
      });
    })
  ];
  environment.systemPackages = with pkgs; [
    dwmblocks
    st
    dmenu
    xsel
    xclip
    xwallpaper
    maim
    xcompmgr
    nsxiv
    xdotool
    haskellPackages.greenclip
  ];
}
