{...}: {
  services = {
    gvfs.enable = true;
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    getty.autologinUser = "xenoxanite";
  };
}
