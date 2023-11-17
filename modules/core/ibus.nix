{ pkgs, ... }:
let
  ibus-toggle-layout = pkgs.writeShellScriptBin "ibus-toggle-layout" ''
    engine=$(ibus engine)
    path=$HOME/.cache/ibus-layout

    if [ ! -f $path ]; then
      touch $path
    fi

    if [ "$engine" == "xkb:us::eng" ]; then
      ibus engine OpenBangla - OpenBangla Keyboard 
      echo "󰌌 BN" > $path
    else
      ibus engine xkb:us::eng - English
      echo "󰌌 EN" > $path
    fi  '';
in {
  i18n.inputMethod.enabled = "ibus";
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines;
    [ openbangla-keyboard ];
  environment.sessionVariables = {
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
    INPUT_METHOD = "ibus";
    SDL_IM_MODULE = "ibus";
  };
  environment.systemPackages = [ ibus-toggle-layout ];
}
