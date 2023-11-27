{ pkgs, stdenv, ... }:
stdenv.mkDerivation rec {
  pname = "zathura-pywal";

  
  version = "2019-10-21";

  src = pkgs.fetchFromGitHub {
    owner = "GideonWolfe";
    repo = pname;
    rev = "master";
    sha256 = "0vwjvfamgcbgfjsv2rz8293fldjnqzf32nvra707cvp17cj6l0k5";
  };

  nativeBuildInputs = [ pkgs.zathura ];

  dontBuild = true;
  installPhase =
    "	mkdir -p $out/bin\n	chmod +x genzathurarc\n	chmod +x zathura\n\n	substituteInPlace zathura \\\n	    --replace \"genzathurarc\" \"$out/bin/genzathurarc\" \\\n		--replace \"zathura --\" \"${pkgs.zathura}/bin/zathura --\"\n\n	cp genzathurarc $out/bin/\n	cp zathura $out/bin/\n\n	ln -s ${pkgs.zathura}/share $out/share\n";
}
