{pkgs, ...}: let
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" ''
    launcher="rofi -dmenu"
    wallpaper_daemon="swww img"
    wallpaper_folder=$HOME/Pictures/wallpapers
    setWallpaper() {
       wallpaper_location="$(ls $wallpaper_folder/$temp_dir | $launcher)"
        if [[ -d $wallpaper_folder/$wallpaper_location ]]; then
        temp_dir=""
            if [ "$wallpaper_folder/$wallpaper_location" = "$wallpaper_folder/$temp_dir" ]; then
                exit 0
            else
                temp_dir=$wallpaper_location
                setWallpaper
            fi
        elif [[ -f $wallpaper_folder/$temp_dir/$wallpaper_location ]]; then
            $wallpaper_daemon $wallpaper_folder/$temp_dir/$wallpaper_location &
            wal -i $wallpaper_folder/$temp_dir/$wallpaper_location  && reload &
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
