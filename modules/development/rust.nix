{pkgs, ...}: {
  home-manager.users.xenoxanite = {
    home.packages = with pkgs; [
      cargo
      rustc
    ];
    home.sessionPath = [
      "$HOME/.cargo/bin"
    ];
  };
}
