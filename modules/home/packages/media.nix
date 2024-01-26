{ pkgs, ... }: {
  home.packages = with pkgs; [
    libsForQt5.kdenlive
    glaxnimate
    imv
    mpv
    ytfzf
    ani-cli
    ffmpeg-full
  ];
}
