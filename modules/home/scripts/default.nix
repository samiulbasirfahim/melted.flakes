{pkgs, ...}: let
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
in {
  imports = [(import ./wallpaper-picker.nix)] ++ [(import ./random-wall.nix)] ++ [(import ./reload.nix)] ++ [(import ./reload-discord.nix)];
  home.packages = [cava-internal pkgs.cava launch-wlogout];
}
