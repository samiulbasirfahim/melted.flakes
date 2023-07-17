{
  security = {
    rtkit.enable = true;
    sudo.enable = true;
    polkit.enable = true;
    pam.services.swaylock = {};
    sudo.wheelNeedsPassword = false;
  };
}
