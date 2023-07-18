{
  config,
  pkgs,
  ...
}: let
in {
  imports = [(import ./rofi.nix)] ++ [(import ./alacritty.nix)];
  programs.kitty.enable = true;
  programs.kitty.extraConfig = ''
    include ${config.xdg.cacheHome}/wal/colors-kitty.conf
  '';
  programs.pywal = {
    enable = true;
  };
}