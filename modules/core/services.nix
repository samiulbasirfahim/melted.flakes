{pkgs, ...}: {
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    getty.autologinUser = "xenoxanite";
    mongodb = {
      # enable = true;
      package = pkgs.mongodb-6_0;
      user = "xenoxanite";
      dbpath = "/home/xenoxanite/.local/share/mongodb";
    };
  };
}
