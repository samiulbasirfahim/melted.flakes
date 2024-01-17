{ pkgs, ... }: {
  home.packages = with pkgs; [
    libsForQt5.kdenlive
    glaxnimate
    darktable
    imv
    mpv
    ytfzf
    ani-cli
    ffmpeg-full
  ];
}
