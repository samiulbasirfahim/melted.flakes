{ pkgs, config, lib, ... }:
with lib;
let

  sddmTheme = import ../../pkgs/sddm-theme { inherit pkgs; };
in {
  imports = [ ./dwm ];
  config = {
    services.xserver = {
      enable = true;
      dpi = 96;
      displayManager = {
        sddm = {
          enable = false;
          theme = "${sddmTheme}";
        };
        startx.enable =
          if config.services.xserver.displayManager.sddm.enable then
            false
          else
            true;
      };

      videoDrivers = [ "amdgpu" ];
      deviceSection = ''Option "TearFree" "true"'';
    };
    programs.zsh = mkIf config.services.xserver.displayManager.startx.enable {
      loginShellInit = ''
        if [[ "$(tty)" == "/dev/tty1" ]] then
          startx
        fi
      '';
    };
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal ];
      config.common.default = "*";
    };
    environment.systemPackages = with pkgs;
      (if config.services.xserver.displayManager.sddm.enable then [
        libsForQt5.qt5.qtquickcontrols2
        libsForQt5.qt5.qtgraphicaleffects
      ] else
        [ ]);
  };
}
