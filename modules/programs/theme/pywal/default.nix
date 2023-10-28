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
      $color10 = rgb({color10.strip})
      $color13 = rgb({color13.strip})
    '';
  };
}
