{pkgs, ...}: {
  imports =
    [(import ./python.nix)]
    ++ [(import ./rust.nix)]
    ++ [(import ./javascript.nix)];
  home.packages = with pkgs; [
    pavucontrol
    xfce.thunar

    # utilites
    btop
    bleachbit
    exa
    joplin-desktop
    playerctl
    gparted
    pamixer
    obsidian
    bat
    lsix

    # Multimedia
    mpv
    imv

    # Chrome
    chromium

    # Email client
    # evolution

    # Nixos
    nix-prefetch-github
    gcc

    # Amd gpu
    radeontop
  ];
}
