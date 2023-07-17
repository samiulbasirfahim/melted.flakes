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
}
