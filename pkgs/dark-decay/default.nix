{ lib, stdenv, fetchzip, pkgs, ... }:
stdenv.mkDerivation rec {
  pname = "dark-decay";
  version = "0.2.0";

  src = fetchzip {
    url =
      "https://github.com/decaycs/decay-gtk/releases/download/v0.2.0/Dark-decay.zip";
    sha256 = "6X6/Q5dcvngrq3G7zo9yrYOP6jWMX3UcDM1I00WEOlM=";
    stripRoot = false;
  };

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes/
    cp -r Dark-decay $out/share/themes
  '';

  meta = {
    description = "Dark decay gtk theme";
    homepage = "https://github.com/decaycs/decay-gtk/";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
