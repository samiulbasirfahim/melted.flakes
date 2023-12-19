{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
    displayManager.sddm.enable = true;
    # deviceSection = ''Option "TearFree" "true"'';
    videoDrivers = [ "amdgpu" ];
    # displayManager.startx.enable = true;
  };

  # displayManager.startx.enable = true;
}
