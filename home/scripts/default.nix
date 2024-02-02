{ pkgs, ... }:
let
  load-wallpaper = pkgs.writeShellScriptBin "load-wallpaper" ''
    xwallpaper --stretch $(grep -o "'/[^']*'" <<< cat $HOME/.fehbg | cut -d "'" -f 2)
    wal -i $(grep -o "'/[^']*'" <<< cat $HOME/.fehbg | cut -d "'" -f 2)
    xdotool key super+F5
  '';
  clipboard_dmenu = pkgs.writeShellScriptBin "clipboard_dmenu"
    "\ngreenclip print | sed '/^$/d' | dmenu -bw 0 | xargs -r -d'\n' -I '{}' greenclip print '{}'\n  ";

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
      swww img $1
      $wallpaper_daemon $1
      reload-wm
      betterlockscreen -u $wallpaper_location &
    else
      wallpaper_location=$(find $HOME/pix/wallpapers -name "*.png" -o -name "*.jpg" -o -name "*.gif" | sxiv -tio)
      if [ -f "$wallpaper_location" ]; then
        swww img $wallpaper_location
        $wallpaper_daemon $wallpaper_location
        reload-wm
        betterlockscreen -u $wallpaper_location &
      fi
    fi
  '';
  reload-wm = pkgs.writeShellScriptBin "reload-wm" ''
    hyprctl reload &
    pkill -SIGUSR2 waybar &
    reload-discord &
    pywalfox update &
    pkill mako && setsid mako -c /home/xenoxanite/.cache/wal/mako.conf &
  '';
in {
  home = {
    packages = [
      load-wallpaper
      # schedule-power-off
      clipboard_dmenu
      set-wallpaper
      reload-wm
    ];
  };
}
