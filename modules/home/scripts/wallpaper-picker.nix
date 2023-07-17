{pkgs, ...}: let
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" ''
    launcher="rofi -dmenu"
    wallpaper_daemon="wal -i"
    wallpaper_folder=$HOME/Pictures/wallpapers
    setWallpaper() {
       wallpaper_location="$(ls $wallpaper_folder/$temp_dir | $launcher)"
        if [[ -d $wallpaper_folder/$wallpaper_location ]]; then
            temp_dir=$wallpaper_location
            setWallpaper
        elif [[ -f $wallpaper_folder/$temp_dir/$wallpaper_location ]]; then
            echo "its a file"
            $wallpaper_daemon $wallpaper_folder/$temp_dir/$wallpaper_location
            xdotool key super+F5
            echo "xwallpaper --center  $wallpaper_folder/$temp_dir/$wallpaper_location && wal -i  $wallpaper_folder/$temp_dir/$wallpaper_location" > ~/.local/bin/wallpaper &
        else
            exit 1
        fi
    }
    setWallpaper
  '';
in {
  home.packages = with pkgs; [
    wallpaper-picker
  ];
}
