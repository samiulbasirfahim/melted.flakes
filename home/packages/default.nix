{ pkgs, ... }: {
  home.packages = with pkgs; [
    pulsemixer
    playerctl
    bc
    mediainfo
    mpv
    tgpt
    btop
    yt-dlp
    ytfzf
    calcurse
    gparted
    cinnamon.nemo
    unzip
    fzf
    wget
    ncdu
    yazi
    ani-cli
    google-chrome
    telegram-desktop
    zathura
  ];
}
