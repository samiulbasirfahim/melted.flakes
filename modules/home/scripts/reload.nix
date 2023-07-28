{pkgs, ...}: let
  reload = pkgs.writeShellScriptBin "reload" ''
    hyprctl reload &
    pkill -SIGUSR2 waybar &
    reload-discord &
    pywalfox update &
    pkill mako && setsid mako -c /home/xenoxanite/.cache/wal/mako.conf &
  '';
in {
  home.packages = [reload];
}
