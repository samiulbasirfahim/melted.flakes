{ pkgs, ... }: {
  imports = [ ./dwm ];
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    videoDrivers = [ "amdgpu" ];
    deviceSection = ''Option "TearFree" "true"'';
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal ];
    config.common.default = "*";
  };
  programs.zsh.loginShellInit = ''
    if [[ "$(tty)" == "/dev/tty1" ]] then
      startx
    fi
  '';
  environment.systemPackages = with pkgs; [
    xsel
    xwallpaper
    maim
    xcompmgr
    xclip
    sxiv
    xdotool
    haskellPackages.greenclip
  ];
}
