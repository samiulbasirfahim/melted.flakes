{ pkgs, ... }: {

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
    pcmanfm

    # Multimedia
    mpv
    imv

    # Chrome
    chromium
    vscodium

    tmux
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

    tdesktop
    playit-agent
  ];
}
