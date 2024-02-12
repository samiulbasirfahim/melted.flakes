{ pkgs, ... }: {
  home.packages = with pkgs; [
    pulsemixer
    bc
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
  ];
}
