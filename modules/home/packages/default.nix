{ pkgs, ... }: {

  home.packages = with pkgs; [
    # freetube
    pavucontrol
    unzip
    shotcut
    kdenlive
    btop
    psutils
    slides
    fzf

    bleachbit
    stacer
    eza
    playerctl
    gparted
    pamixer
    xfce.thunar
    neofetch
    pcmanfm
    galculator
    # Multimedia
    mpv
    imv

    croc # Chrome
    chromium
    qutebrowser
    vscode

    # Email client
    # evolution

    # Nixos
    nix-prefetch-github

    # Programming

    # Amd gpu
    radeontop

    ttyper
    yt-dlp
  ];
}
