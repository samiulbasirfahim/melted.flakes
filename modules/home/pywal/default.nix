{
  config,
  pkgs,
  ...
}: let
in {
  imports = [(import ./rofi.nix)] ++ [(import ./alacritty.nix)] ++ [(./mako.nix)];
  programs.pywal = {
    enable = true;
  };
}
