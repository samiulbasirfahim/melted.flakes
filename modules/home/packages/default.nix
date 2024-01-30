{ pkgs, ... }: {
  imports = [ ./media.nix ];
  home.packages = with pkgs; [
    pcmanfm
    wget
    tgpt
    pstree
    unzip
    btop
    pulsemixer
    calcurse
    fzf
    zathura-pywal

    eza
    playerctl
    pamixer
    neofetch

    chromium
    yt-dlp

    libsForQt5.kdenlive
    glaxnimate
    imv
    mpv
    ytfzf
    ani-cli
    ffmpeg_5
  ];
}
