{ pkgs, ... }: {

  home.packages = with pkgs; [
    # freetube
    pavucontrol
    unzip
    shotcut
    kdenlive
    btop

    stacer
    eza
    playerctl
    gparted
    pamixer
    xfce.thunar
    neofetch
    pcmanfm
    galculator
    zathura-pywal
    # Multimedia
    mpv
    imv

    croc # Chrome
    chromium
    vscodium

    # Email client
    # evolution

    # Nixos
    nix-prefetch-github

    # Programming

    # Amd gpu
    radeontop

    ttyper
    yt-dlp

    # wine /for .exe
    winetricks
    wineWowPackages.waylandFull

    playit-agent
  ];
}
