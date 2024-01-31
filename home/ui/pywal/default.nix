{ pkgs, lib, config, ... }:
with lib;
let
  pywalfox_wrapper = pkgs.writeShellScriptBin "pywalfox_wrapper" ''
    ${pkgs.pywalfox-native}/bin/pywalfox start
  '';
in { home.packages = with pkgs; [ pywal ]; }
