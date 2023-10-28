{pkgs, ...}: let
  pywalfox-native = pkgs.pywalfox-native;
  pywalfox_wrapper = pkgs.writeShellScriptBin "pywalfox_wrapper" ''
    ${pywalfox-native}/bin/pywalfox start
  '';
in {
  home-manager.users.xenoxanite = {
    home.packages = with pkgs; [
      pywalfox-native
      pywal
    ];
    home.file.".mozilla/native-messaging-hosts/pywalfox.json-default".text = builtins.replaceStrings ["<path>"] ["${pywalfox_wrapper}/bin/pywalfox_wrapper"] (builtins.readFile "${pywalfox-native}/lib/python3.11/site-packages/pywalfox/assets/manifest.json");
    xdg.configFile."wal/templates/colors-hyprland.conf".text = ''
      $color2 = rgb({color2.strip})
      $color3 = rgb({color3.strip})
      $color4 = rgb({color4.strip})
      $color5 = rgb({color5.strip})
    '';
  };
}
