{
  lib,
  stdenv,
  fetchzip,
  ...
}:
stdenv.mkDerivation rec {
  pname = "cattpuccin-red-cursor";
  version = "1";
  src = fetchzip {
    url = "https://github.com/catppuccin/cursors/raw/main/cursors/Catppuccin-Frappe-Red-Cursors.zip";
    sha256 = "0lqvlkvyn6f6zgycb2nb3il1b9sh1jb6awwhl8hqiwd57rwbjj5z";
  };
  installPhase = ''
    mkdir -p $out/share/icons/Catppuccin-Frappe-Red
    cp -va index.theme cursors $out/share/icons/Catppuccin-Frappe-Red
  '';
  meta = {
    description = "Soothing pastel mouse cursors";
    homepage = "https://github.com/catppuccin/cursors";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
    maintainers = [lib.maintainers.xenoxanite];
  };
}
