{ lib, pkgs, ... }:
let
  hosts = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts";
    hash = "sha256-dRuoJYp5AJGmkI+urd9xRd5HEQfhNX3/b/uDtnc0xyc=";
  };
in { environment.etc."hosts" = { source = lib.mkForce hosts; }; }
