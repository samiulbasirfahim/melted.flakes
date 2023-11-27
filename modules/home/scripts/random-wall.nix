{pkgs, ...}: let
  random-wall = pkgs.writeShellScriptBin "random-wall" ''
    wall=$(find ~/Pictures/wallpapers -type f -name "*.png" -o -name "*.jpg"| shuf -n 1)
    swww img $wall &
  '';
in {
  home.packages = with pkgs; [
    random-wall
  ];
}
