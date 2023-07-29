{pkgs, ...}: {
  imports =
    [(import ./python.nix)]
    ++ [(import ./rust.nix)]
    ++ [(import ./javascript.nix)];
  home.packages = with pkgs; [
    pavucontrol

    # utilites
    unzip
    btop
    bleachbit
    exa
    playerctl
    gparted
    pamixer
    gnome.nautilus

    # Multimedia
    mpv
    imv

    # Chrome
    chromium

    # Email client
    # evolution

    # Nixos
    nix-prefetch-github

    # Programming
    gcc
    php

    # Amd gpu
    radeontop

    mongodb-compass

    bettercap
  ];
}
