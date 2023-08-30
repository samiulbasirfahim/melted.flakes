{pkgs, ...}: {
  home-manager.users.xenoxanite = {
    home.packages = with pkgs; [
      cargo
      rustc
      # surrealdb
    ];
    home.sessionPath = [
      "$HOME/.cargo/bin"
    ];
  };
}
