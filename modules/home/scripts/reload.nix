{pkgs, ...}: let
  reload = pkgs.writeShellScriptBin "reload" ''
    hyprctl reload &
    pkill waybar && setsid waybar &
    reload-discord &
  '';
in {
  home.packages = [reload];
}
