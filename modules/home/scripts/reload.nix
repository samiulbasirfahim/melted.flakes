{pkgs, ...}: let
  reload = pkgs.writeShellScriptBin "reload" ''
    hyprctl reload &
    pkill waybar && setsid waybar &
  '';
in {
  home.packages = [reload];
}
