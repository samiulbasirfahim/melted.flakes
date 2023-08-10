{pkgs, ...}: {
  home-manager.users.xenoxanite = {
    home.packages = with pkgs; [
      yarn
      nodejs
      vite
    ];
    home.sessionPath = [
      "$HOME/.yarn/bin"
    ];
  };
}
