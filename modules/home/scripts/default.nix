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
  desktop_dmenu = pkgs.writeShellScriptBin "desktop_dmenu" "dmenu_recent -c";
  clipboard_dmenu = pkgs.writeShellScriptBin "clipboard_dmenu"
    "\ngreenclip print | sed '/^$/d' | dmenu -c | xargs -r -d'\n' -I '{}' greenclip print '{}'\n  ";

  screenshot_dmenu = let
    output = "$HOME/Pictures/screenshots/$(date '+%y%m%d-%H%M-%S').png";
    xclip_cmd = "xclip -selection clipboard -t image/png -i";
  in pkgs.writeShellScriptBin "screenshot_dmenu" ''
    #!/bin/sh
    case "$(printf "a selected area\\ncurrent window\\nfull screen\\na selected area (copy)\\ncurrent window (copy)\\nfull screen (copy)" | dmenu -c)" in
      "a selected area") maim -s "${output}" ;;
      "current window") maim -q -d 0.2 -i "$(xdotool getactivewindow)" "${output}" ;;
      "full screen") maim -q -d 0.2 "${output}" ;;
      "a selected area (copy)") maim -s | ${xclip_cmd} ;;
      "current window (copy)") maim -q -d 0.2 -i "$(xdotool getactivewindow)" | ${xclip_cmd} ;;
      "full screen (copy)") maim -q -d 0.2 | ${xclip_cmd} ;;
    esac

  '';
  auto-power-off = pkgs.writeShellScriptBin "auto-power-off" ''
    shutdown -P 23:00 &
    time=$(date '+%H')
    if [ "$time" -gt 22 ] || [ "$time" -lt 5 ]; then
      shutdown now
    fi
  '';
in {
  imports = [ (import ./wallpaper-picker.nix) ]
    ++ [ (import ./random-wall.nix) ];
  home.file.".config/cava/config1".text = ''

    [general]
    bars = 12
    sleep_timer = 10

    [output]
    method = raw
    data_format = ascii
    ascii_max_range = 7
  '';
  home.packages = [
    cava-internal
    pkgs.cava
    launch-wlogout
    load-wallpaper
    auto-power-off
    screenshot_dmenu
    desktop_dmenu
    clipboard_dmenu
  ];
  home.file.".local/bin/dmenu_recent".source = ./dmenu_recent;
}
