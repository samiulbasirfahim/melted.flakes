{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland.enable = true;
  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
}
