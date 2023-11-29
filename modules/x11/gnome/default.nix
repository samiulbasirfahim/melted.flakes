{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    deviceSection = ''Option "TearFree" "true"'';
    # displayManager.startx.enable = true;
  };

  # displayManager.startx.enable = true;
  environment.systemPackages = [ pkgs.gnome.gnome-tweaks ];
}
