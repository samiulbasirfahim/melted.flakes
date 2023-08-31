{pkgs, ...}: let
  cava-internal = pkgs.writeShellScriptBin "cava-internal" ''
    cava -p ~/.config/cava/config1 | sed -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'
  '';
in {
  imports = [(import ./wallpaper-picker.nix)] ++ [(import ./random-wall.nix)] ++ [(import ./reload.nix)] ++ [(import ./reload-discord.nix)];
  home.packages = [cava-internal pkgs.cava];
}
