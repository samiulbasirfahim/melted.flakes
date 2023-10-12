{pkgs, ...}: let
  waybar_spawn = pkgs.writeShellScriptBin "waybar_spawn" ''
    pkill -SIGUSR1 .waybar-wrapped &
    sleep 1 && pkill -SIGUSR1 .waybar-wrapped &
  '';
in {
  home.packages = with pkgs; [
    waybar_spawn
  ];
}
