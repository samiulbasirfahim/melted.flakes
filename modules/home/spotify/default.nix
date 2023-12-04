{ pkgs, inputs, lib, ... }:
let
  officialThemes = pkgs.fetchFromGitHub {
    owner = "spicetify";
    repo = "spicetify-themes";
    rev = "eb6b818368d9c01ef92522623b37aa29200d0bc0";
    sha256 = "sha256-Q/LBS+bjt2WP/s43LE8hDjYHxPVorT/RA71esPraLOM=";
  };
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  ui = import ./../../theme/ui.nix { };
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
    customColorScheme = with ui.colors; {
      text = green;
      subtext = blue;
      extratext = blue;
      main = background;
      sidebar = contrast;
      player = contrast;
      sec-player = statusline_bg;
      card = statusline_bg;
      sec-card = statusline_bg;
      shadow = contrast;
      selected-row = green;
      button = green;
      button-active = green;
      button-disabled = lighter;
      tab-active = green;
      notification = lighter;
      notification-error = red;
      misc = lighter;
    };
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      hidePodcasts
      adblock
      keyboardShortcut
    ];
  };
}
