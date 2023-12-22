{
  services.xserver = {
    enable = true;
    deviceSection = ''Option "TearFree" "true"'';
    videoDrivers = [ "amdgpu" ];
    displayManager.sddm.enable = true;
  };
}
