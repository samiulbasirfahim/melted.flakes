{ pkgs, ... }:
let
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" ''
        wallpaper_daemon="wal -i"
        wallpaper_location=$(find $HOME/Pictures/wallpapers -name "*.png" -o -name "*.jpg" -o -name "*.gif" | sxiv -tio)
        if [ -f "$wallpaper_location" ]; then
            $wallpaper_daemon $wallpaper_location
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
        fi
  '';
in { home.packages = with pkgs; [ wallpaper-picker sxiv ]; }
