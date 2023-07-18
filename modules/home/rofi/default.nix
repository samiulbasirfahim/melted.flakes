{pkgs, ...}: {
  imports =
    [(import ./theme.nix)]
    ++ [(import ./config.nix)];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland-unwrapped;
    terminal = "alacritty";
  };
}
