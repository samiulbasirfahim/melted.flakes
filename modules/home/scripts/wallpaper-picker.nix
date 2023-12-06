{ pkgs, ... }:
let
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" ''
    wallpaper_daemon="swww img"
    wallpaper_location=$(find $HOME/Pictures/wallpapers -name "*.png" -o -name "*.jpg" -o -name "*.gif" | sxiv -tio)
    $wallpaper_daemon $wallpaper_location
  '';
in { home.packages = with pkgs; [ wallpaper-picker sxiv ]; }
