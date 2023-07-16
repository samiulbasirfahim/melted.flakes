{
  pkgs,
  lib,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_lqx;
  boot.initrd.kernelModules = ["amdgpu"];
  boot.initrd.systemd.enable = true;
}
