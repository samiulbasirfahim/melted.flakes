{ pkgs, ... }:
let
  set-wallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
    #!/bin/sh

    wallpaper_daemon="wal -i"
    if [ -f "$1" ]; then
      $wallpaper_daemon $1
      xdotool key super+ctrl+shift+Escape &
      betterlockscreen -u $wallpaper_location &
    else
      wallpaper_location=$(find $HOME/Pictures/wallpapers -name "*.png" -o -name "*.jpg" -o -name "*.gif" | sxiv -tio)
      if [ -f "$wallpaper_location" ]; then
        $wallpaper_daemon $wallpaper_location
        xdotool key super+ctrl+shift+Escape &
        betterlockscreen -u $wallpaper_location &
      fi
    fi

    ln -sf ~/.cache/wal/discord.css ~/.config/VencordDesktop/VencordDesktop/themes/discord.css & 
    ln -sf ~/.cache/wal/colors.Xresources ~/.Xresources &                                        
    ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc &                                       

    pkill dunst &
    dunst &
    pywalfox update &
  '';
in { home.packages = with pkgs; [ set-wallpaper sxiv ]; }
