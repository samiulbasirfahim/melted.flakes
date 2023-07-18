{pkgs, ...}: let
  discord = pkgs.discord;
  discord-name = "Discord";
  discocss = with pkgs;
    stdenvNoCC.mkDerivation rec {
      pname = "discocss";
      version = "0.2.3";

      src = fetchFromGitHub {
        owner = "mlvzk";
        repo = pname;
        rev = "v${version}";
        sha256 = "sha256-of7OMgbuwebnFmbefGD1/dOhyTX1Hy7TccnWSRCweW0=";
      };

      dontBuild = true;

      nativeBuildInputs = [makeWrapper];

      installPhase = ''
        install -Dm755 discocss $out/bin/discocss
        wrapProgram $out/bin/discocss --set DISCOCSS_DISCORD_BIN ${discord}/bin/${discord-name}
        ln -s $out/bin/discocss $out/bin/Discord
        ln -s $out/bin/discocss $out/bin/discord
        mkdir -p $out/share
        ln -s ${discord}/share/* $out/share
      '';
    };
  xwaylandvideobridge = with pkgs;
  with libsForQt5;
    stdenv.mkDerivation {
      name = "xwaylandvideobridge";
      version = "unstable";

      patches = [
        (pkgs.fetchpatch {
          # fix on sway (and hyprland)
          url = "https://aur.archlinux.org/cgit/aur.git/plain/cursor-mode.patch?h=xwaylandvideobridge-cursor-mode-2-git";
          hash = "sha256-649kCs3Fsz8VCgGpZ952Zgl8txAcTgakLoMusaJQYa4=";
        })
      ];

      src = fetchFromGitLab {
        domain = "invent.kde.org";
        owner = "system";
        repo = "xwaylandvideobridge";
        rev = "76744c960ead31c3ef56eb20b36190aa63ecfe94";
        hash = "sha256-hu9h6FSsznfdN3s59StR39vrQFQOUg7LI4L+j23E78U=";
      };

      nativeBuildInputs = [wrapQtAppsHook pkg-config cmake extra-cmake-modules];
      buildInputs = [kpipewire qtx11extras ki18n kwidgetsaddons knotifications kcoreaddons];
    };
in {
  home.packages = [
    pkgs.xdg-utils
    discocss
    xwaylandvideobridge
  ];
}
