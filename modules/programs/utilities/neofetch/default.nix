{pkgs, ...}: {
  home-manager.users.xenoxanite = {
    home.packages = [
      pkgs.neofetch
    ];
    xdg.configFile."neofetch".source = ./neofetch;
  };
}
