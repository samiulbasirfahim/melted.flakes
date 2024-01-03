{ pkgs, ... }:
let
  emacs = pkgs.writeShellScriptBin "emc" ''
    ${pkgs.emacs}/bin/emacsclient -c -F "'(fullscreen . fullboth)"
  '';
in {
  home-manager.users.fahim = {
    programs.emacs = { enable = true; };
    home.packages = [ emacs ];
  };
}
