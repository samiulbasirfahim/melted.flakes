{pkgs, ...}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_lqx;
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelParams = ["quiet"];
  boot.initrd.systemd.enable = true;
  boot.plymouth.enable = true;
  boot.plymouth.theme = "pixels";
  environment.systemPackages = [pkgs.plymouth-theme];
}
