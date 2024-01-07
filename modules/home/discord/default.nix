{ pkgs, ... }: {
  imports = [ (import ./theme-template.nix) ];
  home.packages = with pkgs;
    [
      vesktop

    ];
}
