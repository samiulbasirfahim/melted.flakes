{ pkgs, ... }: {
  home.packages = with pkgs; [
    pulsemixer
    pamixer
    nix-prefetch-git
    mpv
    tgpt
    btop
    yt-dlp
    ytfzf
    calcurse
    gparted
    # telegram-desktop
    cinnamon.nemo
    unzip
    hugo
  ];
}
