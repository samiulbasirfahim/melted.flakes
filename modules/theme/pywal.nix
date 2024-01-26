{ pkgs, lib, config, ... }:
with lib;
let
  pywalfox_wrapper = pkgs.writeShellScriptBin "pywalfox_wrapper" ''
    ${pkgs.pywalfox-native}/bin/pywalfox start
  '';
in {
  options.pywal.enable = mkEnableOption "Pywal";
  config = mkIf config.pywal.enable {
    home-manager.users.xenoxanite = {
      home.packages = with pkgs;
        [ pywal ]
        ++ (if config.firefox.enable then [ pywalfox-native ] else [ ]);
      home.file = mkIf config.firefox.enable {
        ".mozilla/native-messaging-hosts/pywalfox.json".text =
          builtins.replaceStrings [ "<path>" ]
          [ "${pywalfox_wrapper}/bin/pywalfox_wrapper" ] (builtins.readFile
            "${pkgs.pywalfox-native}/lib/python3.11/site-packages/pywalfox/assets/manifest.json");

        ".local/share/wal-telegram".source = builtins.fetchGit {
          url = "https://github.com/guillaumeboehm/wal-telegram";
          rev = "47e1a18f6d60d08ebaabbbac4b133a6158bacadd";
        };
      };
    };
  };
}
