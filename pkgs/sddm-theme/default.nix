{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "xenoxanite";
    repo = "sddm-sugar-candy";
    rev = "a44e5546b4da3a4febd1c9364f4c944f148a306f";
    sha256 = "0mv6ll8phf370812y7i7c6779z6xq4y4ynwyljg9sd65ng0vaakx";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
