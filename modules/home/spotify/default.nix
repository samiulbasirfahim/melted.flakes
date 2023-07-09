{
  pkgs,
  inputs,
  lib,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];
  imports = [inputs.spicetify-nix.homeManagerModule];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin-mocha;
    colorScheme = "red";

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      hidePodcasts
      adblock
      history
    ];
  };
}
