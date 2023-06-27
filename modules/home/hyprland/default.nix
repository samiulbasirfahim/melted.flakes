{
  inputs,
  pkgs,
  ...
}: {
  imports =
    [(import ./config.nix)]
    ++ [inputs.hyprland.homeManagerModules.default];

  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
    nvidiaPatches = false;
    systemdIntegration = true;
  };
}
