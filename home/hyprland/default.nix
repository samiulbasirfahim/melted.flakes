{ inputs, lib, ... }: {
  imports = [ inputs.hyprland.homeManagerModules.default ];
  options.hyprland = { enable = lib.mkEnableOption "Enable hyprland"; };
  config = { wayland.windowManager.hyprland = { enable = true; }; };
}
