{
  pkgs,
  lib,
  ...
}: {
  boot = {
    loader = {
        systemd-boot.enable = lib.mkForce  false;
      grub = {
        enable = lib.mkForce true;
        efiSupport = true;
        # efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
        device = "nodev";
      };

      efi.canTouchEfiVariables = true;
    };
    initrd = {
      kernelModules = ["amdgpu"];
      systemd.enable = true;
    };
    kernelPackages = lib.mkDefault pkgs.linuxPackages_xanmod_stable;
  };

  systemd = {
    enableEmergencyMode = false;
    watchdog.runtimeTime = "15s";
    watchdog.rebootTime = "15s";
    network.wait-online.enable = false;
    extraConfig = ''
      DefaultTimeoutStartSec=10s
      DefaultTimeoutStopSec=10s
    '';
  };
}
