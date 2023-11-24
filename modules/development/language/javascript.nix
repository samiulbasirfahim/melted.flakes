{ pkgs, ... }: {
  home-manager.users.xenoxanite = {
    home.packages = with pkgs; [ nodejs yarn ];
  };
}
