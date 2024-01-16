{ pkgs, ... }: {
  boot = {
    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    initrd = {
      systemd.network.wait-online.enable = false;
      kernelModules = [ "amdgpu" ];
    };
  };
}
