{ pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation rec {
  pname = "xclip-pre";

  src = pkgs.fetchFromGitHub {
    owner = "xenoxanite";
    repo = "xclip";
    rev = "main";
    sha256 = "0vwjvfamgcbgfjsv2rz8293fldjnqzf32nvra707cvp17cj6l0k5";
  };

  dontBuild = true;
  installPhase = ''
    mkdir -p $out/bin
    chmod +x *
    cp -r * $out/bin/
  '';
}
