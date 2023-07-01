{
  lib,
  stdenv,
  fetchzip,
  pkgs,
  ...
}:
stdenv.mkDerivation rec {
  pname = "cattpuccin-mocha-gtk";
  version = "1.1.1";

  src = fetchzip {
    url = "https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme/archive/refs/heads/main.zip";
    sha256 = "ujvHVfuvPXHBj9dCJOjxrxCXnE4nkoa6OougJL12Mp0=";
    stripRoot = false;
  };

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes/
    cp -r Catppuccin-GTK-Theme-main/themes/Catppuccin-Mocha-BL-LB $out/share/themes
  '';

  meta = {
    description = "GTK Theme with Catppuccin colour scheme";
    homepage = "https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
    maintainers = [lib.maintainers.xenoxanite];
  };
}
