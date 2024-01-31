{pkgs,...}: {
    home.packages = with pkgs;[
        pulsemixer
        tmux
        pamixer
        nix-prefetch-git
    ];
}
