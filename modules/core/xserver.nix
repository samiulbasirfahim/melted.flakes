{
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    videoDrivers = ["amdgpu"];
    libinput.enable = true;
    libinput.mouse.accelProfile = "flat";
    displayManager = {
      defaultSession = "hyprland";
      lightdm.greeters.mini = {
        enable = true;
        user = "xenoxanite";
        extraConfig = ''
          [greeter]
          show-password-label = false
          [greeter-theme]
          background-image = "/etc/lightdm/catppuccin_code.png"
          border-color = "#964B61"
          background-color = "#1e1e2e"
        '';
      };
      # autoLogin = {
      # enable = true;
      # user = "xenoxanite";
      # };
    };
  };
}
