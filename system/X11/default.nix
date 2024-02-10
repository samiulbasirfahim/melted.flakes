{ pkgs, ... }:
let

  sddmTheme = import ../../pkgs/sddm-theme { inherit pkgs; };
in {
  imports = [ ./dwm ];
  services.xserver = {
    enable = true;
    dpi = 96;
    # desktopManager.plasma5.enable = true;
    displayManager.sddm = {
      enable = true;
      theme = "${sddmTheme}";
    };
    videoDrivers = [ "amdgpu" ];
    deviceSection = ''Option "TearFree" "true"'';
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal ];
    config.common.default = "*";
  };
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
