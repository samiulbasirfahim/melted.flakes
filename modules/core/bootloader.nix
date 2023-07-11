{pkgs, ...}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  boot.initrd.kernelModules = ["amdgpu"];
  boot.initrd.systemd.enable = true;
  boot.kernelModules = ["quiet"];
  boot.plymouth = {
    enable = true;
    themePackages = [pkgs.catppuccin-plymouth];
    theme = "catppuccin-mocha";
  };
}
