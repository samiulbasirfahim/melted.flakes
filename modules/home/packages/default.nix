{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol

    # utilites
    unzip
    btop
    bleachbit
    eza
    playerctl
    gparted
    pamixer
    xfce.thunar
    neofetch
    zathura
    pcmanfm

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
    

    # Amd gpu
    radeontop


    mongodb-compass

    bettercap

    nodePackages_latest.peerflix

    # monkeytype
    ttyper
    cbonsai
    wofi
    yt-dlp
    youtube-tui
  ];
}
