{pkgs,inputs,  ...}: {
  imports = [(import ./settings.nix)] ++ [(import ./style.nix)];

  programs.waybar = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
  };
}
