{ lib, pkgs, ... }:
let
  hosts = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts";
    hash = "sha256-llIQjL+vS79lKHvrciZgjH23uJBxbLDXAAN7dyVCExw=";
  };
in { environment.etc."hosts" = { source = lib.mkForce hosts; }; }
