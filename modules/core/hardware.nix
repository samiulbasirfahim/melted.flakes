{ pkgs, ... }: {
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    package = pkgs.mesa.drivers;
    driSupport = true;
    driSupport32Bit = true;
    package32 = pkgs.pkgsi686Linux.mesa.drivers;
    extraPackages32 = with pkgs.pkgsi686Linux; [ vaapiIntel ];
    extraPackages = with pkgs; [ amdvlk vaapiIntel vaapiVdpau libvdpau-va-gl ];
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
