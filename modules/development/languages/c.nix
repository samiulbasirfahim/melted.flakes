{pkgs, ...}: {
  home-manager.users.xenoxanite = {
    home.packages = with pkgs; [
      # llvmPackages_16.clang-unwrapped
      gcc
    ];
    home.sessionPath = [
    ];
  };
}
