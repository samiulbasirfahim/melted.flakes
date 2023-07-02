{pkgs, ...}: let
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" ''
    wallpaper_folder=$HOME/Pictures/wallpapers
    wallpaper_location="$(ls $wallpaper_folder | rofi -dmenu)"
    if [[ -d $wallpaper_folder/$wallpaper_location ]]; then
        wallpaper_temp="$wallpaper_location"
    elif [[ -f $wallpaper_folder/$wallpaper_location ]]; then
    	swww img $wallpaper_folder/$wallpaper_temp/$wallpaper_location
    else
        exit 1
    fi
  '';
in {
  home.packages = with pkgs; [
    wallpaper-picker
  ];
}
