{ pkgs, ... }: {
  boot = {
    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.systemd.network.wait-online.enable = false;
    initrd.kernelModules = [ "amdgpu" ];
  };
}
