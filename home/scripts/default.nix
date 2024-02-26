{ pkgs, ... }:
let
  load-wallpaper = pkgs.writeShellScriptBin "load-wallpaper" ''
    xwallpaper --stretch $(grep -o "'/[^']*'" <<< cat $HOME/.fehbg | cut -d "'" -f 2)
    wal -i $(grep -o "'/[^']*'" <<< cat $HOME/.fehbg | cut -d "'" -f 2)
    xdotool key super+F5
  '';
  clipboard_dmenu = pkgs.writeShellScriptBin "clipboard_dmenu" ''
    greenclip print | sed "/^$/d" | rofi -dmenu -theme ~/.config/rofi/launcher.rasi | xargs -r -d"\n" -I "{}" greenclip print "{}"
  '';

  schedule-power-off = pkgs.writeShellScriptBin "schedule-power-off" ''
    shutdown -P 22:00 &
    time=$(date '+%H')
    if [ "$time" -gt 21 ] || [ "$time" -lt 5 ]; then
      shutdown now
    fi
  '';
  set-wallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
    #!/bin/sh

    wallpaper_daemon="wal -i"
    if [ -f "$1" ]; then
      swww img "$($1)"
      $wallpaper_daemon $1
      reload-wm
    else
      wallpaper_location=$(find $HOME/pix/wallpapers -name "*.png" -o -name "*.jpg" -o -name "*.gif" | nsxiv -tio)
      if [ -f "$wallpaper_location" ]; then
        swww img $wallpaper_location
        $wallpaper_daemon $wallpaper_location
        reload-wm
      fi
    fi
  '';
  reload-wm = pkgs.writeShellScriptBin "reload-wm" ''
    # xdotool key super+F5
    # pkill dwmblocks && dwmblocks &
    pkill dunst && dunst &
    hyprctl reload &
    pkill -SIGUSR2 waybar &
    reload-discord &
    pywalfox update
  '';
in {
  home = {
    file = { ".local/bin/screenshot_dmenu".source = ./screenshot_dmenu; };
    packages = [
      load-wallpaper
      # schedule-power-off
      clipboard_dmenu
      set-wallpaper
      reload-wm
    ];
  };
}
