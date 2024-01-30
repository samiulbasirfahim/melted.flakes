{ lib, config, pkgs, ... }: {
  options.ibus.enable = lib.mkEnableOption "Ibus";
  config = lib.mkIf config.ibus.enable {
    i18n.inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [ openbangla-keyboard ];
    };
  };
}
