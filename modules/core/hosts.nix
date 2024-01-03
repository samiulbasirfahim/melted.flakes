{ lib, pkgs, ... }:
let
  hosts = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts";
    hash = "sha256-gbX0XggYuBA4zelPfvfresYZTxJQLR9sd0H8zGVJ1TE=";
  };
in { environment.etc."hosts" = { source = lib.mkForce hosts; }; }
