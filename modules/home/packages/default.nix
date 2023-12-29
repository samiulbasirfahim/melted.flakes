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
    ffmpeg
    
    stacer
    eza
    playerctl
    gparted
    pamixer
    xfce.thunar
    neofetch
    galculator
    # Multimedia
    mpv
    imv

    chromium
    vscode

    yt-dlp
    bottles
  ];
}
