{ inputs, pkgs, ...}: {
  imports = [hyprland.homeManagerModules.default];
  wayland.windowManager.hyprland = {
    enable = true;
  };
}