{ inputs, pkgs, ... }:
let spicePkgs = inputs.spicetify.packages.${pkgs.system}.default;
in {
  imports = [ inputs.spicetify.homeManagerModule ];
  programs.spicetify = {
    enable = true;
    injectCss = true;
    replaceColors = true;

    overwriteAssets = true;
    sidebarConfig = true;
    enabledCustomApps = with spicePkgs.apps; [ lyrics-plus ];

    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      keyboardShortcut
      shuffle
      hidePodcasts
      playlistIcons
      adblock
      historyShortcut
      bookmark
      fullAlbumDate
      groupSession
    ];
  };
}
