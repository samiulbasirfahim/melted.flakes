{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [ pkgs.rofi-emoji pkgs.rofi-calc ];
  };
  home.file = {
    ".config/rofi/off.sh".source = ./off.sh;
    ".config/rofi/launcher.rasi".source = ./launcher.rasi;
    ".config/rofi/alt_launcher.rasi".source = ./alt_launcher.rasi;
    ".config/wal/templates/rofi-colors.rasi".source = ./rofi-colors.rasi;
  };
}
