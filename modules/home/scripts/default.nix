{ pkgs, screenshot_menu, ... }:
let
  cava-internal = pkgs.writeShellScriptBin "cava-internal" ''
    cava -p ~/.config/cava/config1 | sed -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'
  '';
  launch-wlogout = pkgs.writeShellScriptBin "launch-wlogout" ''
    wlogout --layout $HOME/.config/wlogout/layout --css $HOME/.config/wlogout/style.css --buttons-per-row 4 \
                  --column-spacing 50 \
                  --row-spacing 50 \
                  --margin-top 250 \
                  --margin-bottom 250 \
                  --margin-left 150 \
                  --margin-right 150
  '';
  load-wallpaper = pkgs.writeShellScriptBin "load-wallpaper" ''
    xwallpaper --stretch $(grep -o "'/[^']*'" <<< cat $HOME/.fehbg | cut -d "'" -f 2)
    wal -i $(grep -o "'/[^']*'" <<< cat $HOME/.fehbg | cut -d "'" -f 2)
    xdotool key super+F5
  '';
  clipboard_dmenu = pkgs.writeShellScriptBin "clipboard_dmenu"
    "\ngreenclip print | sed '/^$/d' | dmenu -bw 0 | xargs -r -d'\n' -I '{}' greenclip print '{}'\n  ";

  schedule-power-off = pkgs.writeShellScriptBin "schedule-power-off" ''
    shutdown -P 23:00 &
    time=$(date '+%H')
    if [ "$time" -gt 22 ] || [ "$time" -lt 5 ]; then
      shutdown now
    fi
  '';
in {
  imports = [ (import ./set-wallpaper.nix) ] ++ [ (import ./random-wall.nix) ];
  home = {
    file = {
      ".local/bin/autolock".source = ./autolock;
      ".local/bin/dmenu_recent".source = ./dmenu_recent;
      ".local/bin/screenshot_dmenu".source = ./screenshot_dmenu;
    };
    packages = [
      cava-internal
      pkgs.cava
      launch-wlogout
      load-wallpaper
      # schedule-power-off
      clipboard_dmenu
    ];
  };
}
