{ pkgs, inputs, lib, ... }:
let
  officialThemes = pkgs.fetchFromGitHub {
    owner = "spicetify";
    repo = "spicetify-themes";
    rev = "eb6b818368d9c01ef92522623b37aa29200d0bc0";
    sha256 = "sha256-Q/LBS+bjt2WP/s43LE8hDjYHxPVorT/RA71esPraLOM=";
  };
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  colors = import ./../../theme/ui.nix { };
in {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "spotify" ];
  imports = [ inputs.spicetify-nix.homeManagerModule ];
  programs.spicetify = {
    enable = true;
    theme = {
      name = "Sleek";
      src = officialThemes;
      appendName = true;
      injectCss = true;
      replaceColors = true;
      overwriteAssets = true;
      sidebarConfig = true;
    };
    colorScheme = "custom";
    customColorScheme = {
      text = colors.green;
      subtext = colors.blue;
      extratext = colors.blue;
      main = colors.background;
      sidebar = colors.contrast;
      player = colors.contrast;
      sec-player = colors.statusline_bg;
      card = colors.statusline_bg;
      sec-card = colors.statusline_bg;
      shadow = colors.contrast;
      selected-row = colors.green;
      button = colors.green;
      button-active = colors.green;
      button-disabled = colors.lighter;
      tab-active = colors.green;
      notification = colors.lighter;
      notification-error = colors.red;
      misc = colors.lighter;
    };
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      hidePodcasts
      adblock
      keyboardShortcut
    ];
  };
}
