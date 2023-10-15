{pkgs, ...}: {
  home-manager.users.xenoxanite = {
    home.packages = with pkgs; [
      # llvmPackages_15.clang-unwrapped
    #      ccls
      gcc
      llvmPackages_9.clang-unwrapped
    ];
    home.sessionPath = [
    ];
  };
}
