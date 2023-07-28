{pkgs, ...}: let
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
  imports = [(import ./theme-template.nix)];
  home.packages = with pkgs; [
    xdg-utils
    xwaylandvideobridge
    discord
  ];
}
