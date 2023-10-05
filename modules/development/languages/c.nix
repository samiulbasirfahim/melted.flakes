{pkgs, ...}: {
  home-manager.users.xenoxanite = {
    home.packages = with pkgs; [
      # llvmPackages_15.clang-unwrapped
      ccls
      gcc
    ];
    home.sessionPath = [
    ];
  };
}
