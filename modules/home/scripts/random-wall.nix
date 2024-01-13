{ pkgs, ... }:
let
  random-wall = pkgs.writeShellScriptBin "random-wall" ''
      wallpaper_daemon="wal -i"
      wall=$(find ~/Pictures/wallpapers -type f -name "*.png" -o -name "*.jpg"| shuf -n 1)

      $wallpaper_daemon $wall
      xdotool key super+F5 &
      # dwmblock status2d color
    	pkill dwmblocks && dwmblocks &
      # dunst
      ln -sf ~/.cache/wal/discord.css ~/.config/VencordDesktop/VencordDesktop/themes/discord.css &
      ln -sf ~/.cache/wal/colors.Xresources ~/.Xresources &
      ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc &
      pkill dunst &
      dunst &
      # firefox
      pywalfox update &
      betterlockscreen -u $wallpaper_location
  '';
in { home.packages = with pkgs; [ random-wall ]; }
