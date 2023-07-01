{
  inputs,
  pkgs,
  ...
}: {
  imports =
    [(import ./config.nix)]
    ++ [inputs.hyprland.homeManagerModules.default];

  home.packages = with pkgs; [
    hyprpicker
    xdg-utils
    inputs.hyprland-contrib.packages.${pkgs.system}.shellevents
    inputs.hyprland-contrib.packages.${pkgs.system}.scratchpad
    inputs.hyprland-contrib.packages.${pkgs.system}.hyprprop
    inputs.hyprland-contrib.packages.${pkgs.system}.try_swap_workspace

    # Wallpaper deamon
    swww

    # Screenshot and screen-record utility
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    wf-recorder

    # Clipboard manager
    wl-clipboard
    cliphist
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
    nvidiaPatches = false;
    systemdIntegration = true;
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    DISABLE_QT5_COMPAT = "0";
    GDK_BACKEND = "wayland";
    ANKI_WAYLAND = "1";
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
  };
}
