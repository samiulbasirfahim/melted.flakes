{ lib, stdenv, fetchzip, ... }:
stdenv.mkDerivation rec {
  pname = "cattpuccin-dark-cursor";
  version = "111";
  src = fetchzip {
    url =
      "https://github.com/catppuccin/cursors/raw/main/cursors/Catppuccin-Latte-Dark-Cursors.zip";
    sha256 = "m2Cgl93tPnecx3StULF3JirU7lPSMVH49BkPAxapaAk=";
  };
  installPhase = ''
    mkdir -p $out/share/icons/Catppuccin-Latte-Dark
    cp -va index.theme cursors $out/share/icons/Catppuccin-Latte-Dark
  '';
  meta = {
    description = "Soothing pastel mouse cursors";
    homepage = "https://github.com/catppuccin/cursors";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
    maintainers = [ lib.maintainers.xenoxanite ];
  };
}
