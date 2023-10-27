{ pkgs, ... }: {
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.network.wait-online.enable = false;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_lqx;
  boot.initrd.kernelModules = [ "amdgpu" ];
}
