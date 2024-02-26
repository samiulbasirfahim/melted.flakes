{ config, pkgs, ... }: {
  boot = {
    # kernelPackages = pkgs.linuxPackages_xanmod_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  programs.nano.enable = false;
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performancee";
  };
  environment.sessionVariables = { TZ = "${config.time.timeZone}"; };
  services.udev.extraRules = ''
    KERNEL=="card0", SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
  '';
}
