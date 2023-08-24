{pkgs, ...}: let
  wallpaper-picker-dmenu = pkgs.writeShellScriptBin "wallpaper-picker-dmenu" ''
    launcher="rofi -dmenu"
    # launcher="sxiv -tio"
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
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" ''
    wallpaper_daemon="swww img"
    wallpaper_location=$(find $HOME/Pictures/wallpapers -name "*.png" -o -name "*.jpg" | sxiv -tio)
    $wallpaper_daemon $wallpaper_location
    wal -i $wallpaper_location && reload &
  '';
in {
  home.packages = with pkgs; [
    wallpaper-picker-dmenu
    wallpaper-picker
    sxiv
  ];
}
