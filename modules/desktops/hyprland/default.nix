{ pkgs, ... }: {
  imports = [ ./home.nix ./mako ./rofi ./waybar ./wlogout ./swaylock ];
  programs.hyprland.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}
