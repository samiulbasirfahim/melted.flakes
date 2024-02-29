{ config, pkgs, user, ... }: {
  boot = {
    # kernelPackages = pkgs.linuxPackages_xanmod_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performancee";
  };
  programs = { nano.enable = false; };
  virtualisation.libvirtd.enable = true;

  users.users."${user}".extraGroups = [ "libvirtd" ];
  programs.virt-manager.enable = true;
  environment.sessionVariables = { TZ = "${config.time.timeZone}"; };
  services.udev.extraRules = ''
    KERNEL=="card0", SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
  '';

}
