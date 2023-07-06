{...}: {
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.seahorse.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
