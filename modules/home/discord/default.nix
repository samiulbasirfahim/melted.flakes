{ pkgs, ... }: {
  imports = [ (import ./theme-template.nix) ];
  home.packages = with pkgs; [
    xdg-utils
    (discord.override { withVencord = true; })
  ];
}
