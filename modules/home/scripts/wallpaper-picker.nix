{ pkgs, ... }:
let
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" ''
    wallpaper_daemon="wal -i"
    wallpaper_location=$(find $HOME/Pictures/wallpapers -name "*.png" -o -name "*.jpg" -o -name "*.gif" | sxiv -tio)
    if [ -f "$wallpaper_location" ]; then
        $wallpaper_daemon $wallpaper_location
        xdotool key super+ctrl+shift+Escape
        # dunst
        ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
        pkill dunst
        dunst &
        # firefox
        pywalfox update &
    fi
  '';
in { home.packages = with pkgs; [ wallpaper-picker sxiv ]; }
