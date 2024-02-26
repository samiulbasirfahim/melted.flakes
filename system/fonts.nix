{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ twemoji-color-font ];
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override {
        fonts = [ "JetBrainsMono" "Hack" ];
      }) # fonts name can get in ``https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/data/fonts/nerdfonts/shas.nix`
      twemoji-color-font
      font-awesome_5
    ];
  };
}
