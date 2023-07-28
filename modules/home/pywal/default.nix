{pkgs, ...}: let
  pywalfox-native = pkgs.pywalfox-native;
  pywalfox_wrapper = pkgs.writeShellScriptBin "pywalfox_wrapper" ''
    ${pywalfox-native}/bin/pywalfox start
  '';
in {
  imports = [(import ./rofi.nix)] ++ [(import ./alacritty.nix)] ++ [(import ./gtk.nix)];
  programs.pywal = {
    enable = true;
  };
  home.packages = with pkgs; [
    pywalfox-native
  ];
  home.file.".mozilla/native-messaging-hosts/pywalfox.json-default".text = builtins.replaceStrings ["<path>"] ["${pywalfox_wrapper}/bin/pywalfox_wrapper"] (builtins.readFile "${pywalfox-native}/lib/python3.10/site-packages/pywalfox/assets/manifest.json");

  xdg.configFile."wal/templates/colors-hyprland.conf".text = ''$color2 = rgb({color2.strip})'';
}
