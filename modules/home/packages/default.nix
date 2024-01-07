{ pkgs, ... }: {

  home.packages = with pkgs; [
    # freetube
    unzip
    btop
    ytfzf
    pulsemixer
    cmus
    calcurse
    fzf
    zathura-pywal
    ffmpeg-full

    stacer
    eza
    playerctl
    gparted
    pamixer
    xarchiver
    pcmanfm
    neofetch
    galculator
    # Multimedia
    mpv
    imv
    tree

    chromium
    vscode

    yt-dlp
    bottles
  ];
}
