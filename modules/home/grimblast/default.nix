{
  inputs,
  pkgs,
  ...
}: let
  screenshot = pkgs.writeShellScriptBin "screenshot" ''
    DIR=~/Pictures/screenshots
    if [ -d "$DIR" ];
    then
        grimblast --notify --cursor save area DIR/$(date ' + %Y-%m-%d ' T '%H:%M:%S ').png
    else
    	mkdir -p DIR
    fi
  '';
in {
  home.packages = with pkgs; [inputs.hyprland-contrib.pacakges.${pkgs.system}.grimblast];
}
