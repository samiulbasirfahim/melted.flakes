{ pkgs, ... }: {
  home-manager.users.fahim = { home.packages = with pkgs; [ python39 ]; };
}
