{
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.network.wait-online.enable = false;
}
