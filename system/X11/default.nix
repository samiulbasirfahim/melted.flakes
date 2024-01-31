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
  environment.systemPackages = with pkgs; [ xsel xwallpaper maim xcompmgr xclip ];
}
