{pkgs, ...}: let
  reload = pkgs.writeShellScriptBin "reload" ''
    hyprctl reload &
    pkill waybar && setsid waybar &
    reload-discord &
    pkill mako && setsid mako -c /home/xenoxanite/.cache/wal/mako.conf &
  '';
in {
  home.packages = [reload];
}
