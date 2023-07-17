{
  programs = {
    dconf.enable = true;
    seahorse.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    steam = {
      enable = true;
    };
    zsh = {
   enable = true;
    # loginShellInit = ''
    # if [[ "$(tty)" == "/dev/tty1" ]]
    # then
    # exec Hyprland &
    # fi'';
    };
  };
}
