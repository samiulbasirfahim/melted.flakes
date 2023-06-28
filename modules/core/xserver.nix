{...}: {
  services.xserver = {
    enable = true;
    layout = "us";
    videoDrivers = ["amdgpu"];
    libinput.enable = true;
    libinput.mouse.accelProfile = "flat";
    displayManager = {
      defaultSession = "hyprland";
      lightdm.enable = true;
      autoLogin = {
        enable = true;
        user = "xenoxanite";
      };
    };
  };
}
