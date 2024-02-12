{ user, lib, config, ... }:

with lib; {
  services = {
    dbus.enable = true;
    getty = mkIf config.services.xserver.displayManager.startx.enable {
      autologinUser = "${user}";
    };
    gvfs.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

}
