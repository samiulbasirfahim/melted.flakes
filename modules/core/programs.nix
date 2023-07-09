{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.zsh.loginShellInit = ''
    if [[ "$(tty)" == "/dev/tty1" ]]
     then
      exec Hyprland &
    fi'';
  programs.seahorse.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
