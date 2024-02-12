{ pkgs, lib, inputs, config, ... }:
let spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  options.spotify.enable = lib.mkEnableOption "Spotify";
  config = lib.mkIf config.spotify.enable {
    programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
      enabledCustomApps = with spicePkgs.apps; [ lyrics-plus ];
      enabledExtensions = with spicePkgs.extensions; [
        hidePodcasts
        bookmark
        fullAppDisplay
        adblock
        keyboardShortcut
        volumePercentage
        autoSkip
      ];
    };
  };
}
