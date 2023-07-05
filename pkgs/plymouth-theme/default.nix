{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "adi1090x-plymouth";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "adi1090x";
    repo = "plymouth-themes";
    rev = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
    hash = "sha256-VNGvA8ujwjpC2rTVZKrXni2GjfiZk7AgAn4ZB4Baj2k=";
  };

  preferLocalBuild = true;
  allowSubstitutes = false;

  installPhase = ''
    mkdir -p $out/share/plymouth/themes/
    for pack in pack_1 pack_2 pack_3 pack_4; do
    	cd $pack
    	for theme in $(ls); do
    		cd $theme
    		sed -i "s@\/usr\/@$out\/@" ./$theme.plymouth
    		cd ..
    	done
    	cd ..
    done
    cp -vr pack_3/pixels $out/share/plymouth/themes
  '';
}
