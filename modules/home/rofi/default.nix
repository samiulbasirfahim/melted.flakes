{pkgs, ...}: {
  imports = [(import ./theme.nix)];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland-unwrapped;
    terminal = "foot";
  };
}
