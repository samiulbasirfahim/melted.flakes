{ pkgs, ... }: {
  imports = [ ./media.nix ];
  home.packages = with pkgs; [
    # freetube
    pstree
    unzip
    btop
    ytfzf
    pulsemixer
    cmus
    calcurse
    fzf
    zathura-pywal

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
    tree

    chromium
    vscode
    kitty
    yt-dlp
  ];
}
