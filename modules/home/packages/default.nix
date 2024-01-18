{ pkgs, ... }: {
  imports = [ ./media.nix ];
  home.packages = with pkgs; [
    # freetube
    wget
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
  ];
}
