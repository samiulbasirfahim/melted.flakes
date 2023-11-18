{ pkgs, ... }: {
  home-manager.users.xenoxanite = {
    home.packages = with pkgs;
      [
        gcc13
      ];
  };
}
