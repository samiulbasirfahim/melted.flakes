{...}: {
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.polkit.enable = true;
  security.pam.services.swaylock = {};
}
