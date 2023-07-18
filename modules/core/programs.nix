{
  programs = {
    dconf.enable = true;
    seahorse.enable = true;
    fish.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
