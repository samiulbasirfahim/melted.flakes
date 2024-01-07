{ lib, pkgs, ... }:
let
  hosts = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts";
    hash = "sha256-lrXe4N88XIP6AeA68rUWmUE6DeiTKjOXQ2mzF/XjKV8=";
  };
in { environment.etc."hosts" = { source = lib.mkForce hosts; }; }
