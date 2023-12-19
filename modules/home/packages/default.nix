{ pkgs, ... }: {

  home.packages = with pkgs; [
    # freetube
    pavucontrol
    unzip
    btop
    fzf

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
