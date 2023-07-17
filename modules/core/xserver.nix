{pkgs, ...}: {
  services.xserver = {
    enable = true;
    videoDrivers = ["amdgpu"];
    displayManager.startx.enable = true;
    windowManager.dwm.enable = true;
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
    };
  };
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        src = /home/xenoxanite/Suckless/dwm;
        buildInputs = (old.buildInputs or []) ++ [pkgs.harfbuzz];
        nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.pkg-config];
      });
      st = prev.st.overrideAttrs (old: {
        src = /home/xenoxanite/Suckless/st;
        buildInputs = (old.buildInputs or []) ++ [pkgs.harfbuzz];
        nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.pkg-config];
      });
      dmenu = prev.dmenu.overrideAttrs (old: {
        src = /home/xenoxanite/Suckless/dmenu;
        buildInputs = (old.buildInputs or []) ++ [];
        nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.pkg-config];
      });
      dwmblocks = prev.dwmblocks.overrideAttrs (old: {
        src = /home/xenoxanite/Suckless/dwmblocks;
        buildInputs = (old.buildInputs or []) ++ [];
        nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.pkg-config];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    dmenu
    st
    dwmblocks
    xorg.libXft
    xorg.libXinerama
    xwallpaper
    xcompmgr
    pywal
    xdotool
    flameshot
    siduck76-st
    xclip
    
  ];
}
