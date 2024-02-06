{ pkgs, ... }:
let
  catppuccin = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/NarutoXY/qutebrowser/main/catppuccin.py";
    sha256 = "sha256-71XveJA3ndPFMbT5WMIxtlz4PlxbIRDdrMX7UqnIYRo=";
    name = "qutebrowser-catppuccin.py";
  };
in {
  programs.qutebrowser = {
    enable = true;
    searchEngines = { mn = "https://mynixos.com/search?q={}"; };
    package = pkgs.qutebrowser.override { enableWideVine = true; };
    extraConfig = builtins.readFile catppuccin;
    settings = {
      colors.webpage.preferred_color_scheme = "dark";
      content.javascript.enabled = false;
      downloads.location.directory = "$HOME/downloads";
      url = {
        start_pages = "https://searx.puffyan.us";
        default_page = "https://searx.puffyan.us";
      };
    };
  };
}
