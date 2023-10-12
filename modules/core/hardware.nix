{pkgs, ...}: {
  hardware.opengl = {
    enable = true;
    package = pkgs.mesa.drivers;
    driSupport = true;
    driSupport32Bit = true;
    package32 = pkgs.pkgsi686Linux.mesa.drivers;
    extraPackages = [pkgs.amdvlk];
  };
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performancee";
  };
  # amd_performance_level = "high";
  services.udev.extraRules = ''
    KERNEL=="card0", SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
  '';
  # systemd.services.amdgpu-overclock = {
  #   description = "Overclock AMD GPU";
  #   after = ["suspend.target" "multi-user.target" "systemd-user-sessions.service"];
  #   wantedBy = ["sleep.target" "multi-user.target"];
  #   wants = ["modprobe@amdgpu.service"];
  #   script = let
  #     gpuDevice = "/sys/devices/pci0000:00/0000:00:03.1/0000:09:00.0/0000:0a:00.0/0000:0b:00.0";
  #   in ''
  #     echo '293000000' > ${gpuDevice}/hwmon/hwmon5/power1_cap # max power limit to 293 W
  #     echo 'manual'    > ${gpuDevice}/power_dpm_force_performance_level # needed for p-state and power profile
  #     echo 's 1 2650'  > ${gpuDevice}/pp_od_clk_voltage # overclock gpu core to 2650 MHz
  #     echo 'm 1 1050'  > ${gpuDevice}/pp_od_clk_voltage # overclock mem to 2100 Mhz
  #     echo 'vo -60'    > ${gpuDevice}/pp_od_clk_voltage # underclock by 60 mV
  #     echo 'c'         > ${gpuDevice}/pp_od_clk_voltage
  #     echo '3'         > ${gpuDevice}/pp_dpm_mclk # highest p-state
  #     echo '1'         > ${gpuDevice}/pp_power_profile_mode # 3d full screen power profile
  #   '';
  #   serviceConfig.Type = "oneshot";
  # };
}
