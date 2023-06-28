{...}: {
  services.xserver = {
    enable = true;
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
