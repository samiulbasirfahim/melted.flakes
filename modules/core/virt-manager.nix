{
  virtualisation.libvirtd.enable = true;
  users.users.xenoxanite.extraGroups = [ "libvirtd" ];
  programs.virt-manager.enable = true;
}
