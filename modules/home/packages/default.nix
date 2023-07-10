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
    exa
    joplin-desktop
    playerctl
    gparted
    etcher
    unetbootin
    # Multimedia
    mpv
    imv

    # Chrome
    chromium

    # Email client
    evolution

    # Nixos
    nix-prefetch-github

    # Games
    # osu-lazer
    # xonotic
    gamescope
    gamemode
  ];
}
