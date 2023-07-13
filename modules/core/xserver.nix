{
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    videoDrivers = ["amdgpu"];
    libinput.enable = true;
    libinput.mouse.accelProfile = "flat";
    windowManager.dwm.enable = true;
    displayManager = {
      defaultSession = "hyprland";
    };
  };
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: { src = /home/xenoxanite/dotfiles/.config/suckless/dwm; });
    })
];
}
