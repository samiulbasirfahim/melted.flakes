{ pkgs, inputs, lib, ... }:
let
  officialThemes = pkgs.fetchFromGitHub {
    owner = "spicetify";
    repo = "spicetify-themes";
    rev = "eb6b818368d9c01ef92522623b37aa29200d0bc0";
    sha256 = "sha256-Q/LBS+bjt2WP/s43LE8hDjYHxPVorT/RA71esPraLOM=";
  };

  gruvbox = {
    normal = {
      orange = "d65d0e";
      red = "cc241d";
      green = "98971a";
      yellow = "d79921";
      blue = "458588";
      purple = "b16286";
      aqua = "689d6a";
      gray = "a89984";
    };
    bright = {
      red = "fb4934";
      green = "b8bb26";
      yellow = "fabd2f";
      blue = "83a598";
      purple = "d3869b";
      aqua = "8ec07c";
      orange = "fe8019";
      gray = "928374";
    };
    bg = gruvbox.bg0;
    bg0 = "282828";
    bg0_h = "1d2021";
    bg0_s = "32302f";
    bg1 = "3c3836";
    bg2 = "504945";
    bg3 = "665c54";
    bg4 = "7c6f64";
    fg = gruvbox.fg1;
    fg0 = "fbf1c7";
    fg1 = "ebdbb2";
    fg2 = "d5c4a1";
    fg3 = "bdae93";
    fg4 = "a89984";
    inherit (gruvbox.bright) orange red green yellow blue purple aqua gray;
  };
  blackish = "141414";
  slighter = "1e1e1e";

  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  colors = import ./../../theme/ui.nix { };
in {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "spotify" ];
  imports = [ inputs.spicetify-nix.homeManagerModule ];
  programs.spicetify = {
    enable = true;
    theme = {
      name = "Onepunch";
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
      sidebar = colors.background;
      player = colors.background;
      sec-player = colors.brightblack;
      card = colors.contrast;
      sec-card = colors.contrast;
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
