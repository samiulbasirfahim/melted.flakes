{pkgs, ...}: {
  home-manager.users.fahim = {
    home.packages = [
      pkgs.neofetch
    ];
    xdg.configFile."neofetch".source = ./neofetch;
  };
}
