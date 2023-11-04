{ pkgs, ... }: {
  hardware.opengl = {
    enable = true;
    package = pkgs.mesa.drivers;
    driSupport = true;
    driSupport32Bit = true;
    package32 = pkgs.pkgsi686Linux.mesa.drivers;
    extraPackages = [ pkgs.amdvlk ];
  };
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performancee";
  };
  # amd_performance_level = "high";
  services.udev.extraRules = ''
    KERNEL=="card0", SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
  '';
}
