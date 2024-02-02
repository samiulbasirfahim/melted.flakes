{ user, ... }: {
  virtualisation.libvirtd.enable = true;
  programs = {
    dconf = { enable = true; };
    virt-manager.enable = true;
  };
  users.users.${user}.extraGroups = [ "libvirtd" ];
  home-manager.users.${user}.dconf.settings = {
    "org/virt-manager/virt-manager/connections".autoconnect =
      [ "qemu:///system" ];
    "org/virt-manager/virt-manager/connections".uris = [ "qemu:///system" ];
  };
}
