{...}:{
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    displayManager.startx.enable = true;
    windowManager.dwm.enable = true;
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
    };
  };
}
