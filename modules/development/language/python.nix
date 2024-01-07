{ pkgs, ... }: {
  home-manager.users.xenoxanite = { home.packages = with pkgs; [ python39 ]; };
}
