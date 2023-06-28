{
  lib,
  stdenv,
  fetchzip,
  ...
}:
stdenv.mkDerivation rec {
  pname = "cattpuccin-dark-cursor";
  version = "1";
  src = fetchzip {
    url = "https://github.com/catppuccin/cursors/raw/main/cursors/Catppuccin-Latte-Dark-Cursors.zip";
    sha256 = "nes6ADEqEv4g7knF0FBXE6FEIIpQR3nLH2aRFsReyh4=";
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
    maintainers = [lib.maintainers.xenoxanite];
  };
}
