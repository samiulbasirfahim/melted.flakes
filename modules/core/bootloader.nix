{
  pkgs,
  lib,
  ...
}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      kernelModules = ["amdgpu"];
      systemd.enable = true;
    };
    kernelPackages = lib.mkDefault pkgs.linuxPackages_xanmod_stable;
  };
}
