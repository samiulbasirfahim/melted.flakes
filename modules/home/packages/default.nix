{pkgs, ...}: {
  imports =
    [(import ./python.nix)]
    ++ [(import ./javascript.nix)];
  home.packages = with pkgs; [
    webcord
    pavucontrol
    xfce.thunar

    # utilites
    btop
    bleachbit

    # Multimedia
    mpv
    imv

    # Chrome
    chromium

    # Email client
    evolution
  ];
}
