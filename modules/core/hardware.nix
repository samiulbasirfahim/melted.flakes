{pkgs, ...}: {
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
}
