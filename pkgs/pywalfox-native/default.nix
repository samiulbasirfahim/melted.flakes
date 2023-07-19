{
  pkgs,
  lib,
}:
with pkgs.python3.pkgs;
  buildPythonApplication rec {
    pname = "pywalfox";
    version = "2.7.4";

    src = fetchPypi {
      inherit pname version;
      sha256 = "59e73d7e27389574fb801634e03d8471f09bfe062865cad803f68c456680ed66";
    };

    propagatedBuildInputs = [setuptools];

    doCheck = false;
    pythonImportsCheck = ["pywalfox"];

    meta = with lib; {
      homepage = "https://github.com/Frewacom/pywalfox-native";
      description = "Native app used alongside the Pywalfox addon.";
      license = licenses.mpl20;
      platforms = ["x86_64-linux"];
      maintainers = [];
    };
  }
