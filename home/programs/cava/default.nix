{ pkgs, ... }:
let
  cava-internal = pkgs.writeShellScriptBin "cava-internal" ''
    cava -p ~/.config/cava/cavainternal | sed -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'
  '';
in {
  xdg.configFile."cava/cavainternal".text = ''
    [general]
    bars = 12
    sleep_timer = 10

    [output]
    method = raw
    data_format = ascii
    ascii_max_range = 7
  '';
  home.packages = with pkgs; [ cava cava-internal ];
}
