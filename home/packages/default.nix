{ pkgs, ... }: {
  home.packages = with pkgs; [
    pulsemixer
    pamixer
    nix-prefetch-git
    mpv
    tgpt
    btop
    calcurse
    vesktop
    telegram-desktop
    cava
    wl-clipboard
    cliphist
    libnotify
    cinnamon.nemo
  ];
}
