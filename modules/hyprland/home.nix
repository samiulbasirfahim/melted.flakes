{
  pkgs,
  inputs,
  ...
}: {
  home-manager.users.xenoxanite = {
    systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];

    home.packages = with pkgs; [
      hyprpicker
      xdg-utils
      inputs.hyprland-contrib.packages.${pkgs.system}.hyprprop
      # xwaylandvideobridge

      # Wallpaper deamon
      swww

      # Screenshot and screen-record utility
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
      wf-recorder

      # Clipboard manager
      wl-clipboard
      cliphist

      #Security
      mate.mate-polkit
      foot

      # qt
      # qt6-wayland
      # qt5-wayland
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      systemdIntegration = true;
      xwayland = {
        enable = true;
        hidpi = true;
      };
      settings = {
        "$mainMod" = "SUPER";
        monitor = [
          ",highres, auto, auto"
          ",highrr,auto,auto"
        ];
        source = [
          "/home/xenoxanite/.cache/wal/colors-hyprland.conf"
        ];
        input = {
          kb_layout = "us";
          numlock_by_default = true;
          follow_mouse = 1;
          sensitivity = 0;
        };
        misc = {
          disable_autoreload = false;
          disable_hyprland_logo = true;
          always_follow_on_dnd = true;
          layers_hog_keyboard_focus = true;
          animate_manual_resizes = false;
          enable_swallow = true;
          focus_on_activate = true;
        };
        general = {
          gaps_in = 6;
          gaps_out = 10;
          border_size = 2;
          "col.inactive_border" = "rgba(000000ee)";
          apply_sens_to_raw = 1;
        };
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
        decoration = {
          rounding = 0;
          active_opacity = 0.9;
          inactive_opacity = 0.9;
          blur = true;
          blur_size = 5;
          blur_passes = 2;
          multisample_edges = true;
          blur_new_optimizations = true;
          drop_shadow = false;
        };
        animations = {
          enabled = true;
          bezier = "overshot, 0.13, 0.99, 0.29, 1.1";
          animation = [
            "windows, 1, 4, overshot, slide"
            "windowsOut, 1, 4, overshot, slide"
            "border, 1, 4, overshot"
            "fade, 1, 4, overshot"
            "workspaces, 1, 4, overshot"
            "specialWorkspace, 1, 5, overshot, slidevert"
          ];
        };
        bind = [
          # basic bindings
          "$mainMod, Q, killactive,"
          "$mainMod, F, fullscreen,"
          "$mainMod, Space, togglefloating,"
          "$mainMod, P, pseudo,"
          "$mainMod, Y, pin,"
          "$mainMod, T, togglesplit,"
          "$mainMod, C, exec, hyprctl dispatch centerwindow none"
          "SUPER, M, movetoworkspace, special"
          "$mainMod SHIFT, M, togglespecialworkspace"
          "$mainMod, mouse_down, workspace, e-1"
          "$mainMod, mouse_up, workspace, e+1"
          # shortcuts bindings
          "$mainMod, Return, exec, foot"
          "$mainMod SHIFT, Return, exec, foot --fullscreen"
          "$mainMod, Z, exec, pkill rofi || rofi -show drun"
          "$mainMod, W, exec, pkill rofi || wallpaper-picker"
          "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          "$mainMod, X, exec, pkill wlogout || wlogout -b 4"
          "$mainMod, B, exec, pkill -SIGUSR1 .waybar-wrapped"
          "$mainMod SHIFT, c ,exec, hyprpicker -a"
          # screenshots bindings
          '',Print, exec, grimblast --notify --cursor save area ~/Pictures/screenshots/screenshot_$(date +"%b_%-d_%Y_%H:%M:%S").png''
          "$mainMod, Print, exec, grimblast --notify --cursor  copy area"
          # switch workspaces bindings
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          # move windows to workspace bindings
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          # switch focus bindings
          "$mainMod, h, movefocus, l"
          "$mainMod, l, movefocus, r"
          "$mainMod, k, movefocus, u"
          "$mainMod, j, movefocus, d"
          # window move bindings
          "SUPER SHIFT, h, movewindow, l"
          "SUPER SHIFT, l, movewindow, r"
          "SUPER SHIFT, k, movewindow, u"
          "SUPER SHIFT, j, movewindow, d"
          # window reposition bindings
          "SUPER SHIFT, h, moveactive,  -80 0"
          "SUPER SHIFT, l, moveactive, 80 0"
          "SUPER SHIFT, k, moveactive, 0 -80"
          "SUPER SHIFT, j, moveactive, 0 80"
          # window resize bindings
          "SUPER CTRL, h, resizeactive, -80 0"
          "SUPER CTRL, l, resizeactive, 80 0"
          "SUPER CTRL, k, resizeactive, 0 -80"
          "SUPER CTRL, j, resizeactive, 0 80"
          # volume control bindings
          ",XF86AudioRaiseVolume,exec, pamixer -i 5"
          ",XF86AudioLowerVolume,exec, pamixer -d 5"
          ",XF86AudioMute,exec, pamixer -t"
          # music control bindings
          ",XF86AudioPlay,exec, playerctl play-pause"
          ",XF86AudioNext,exec, playerctl next"
          ",XF86AudioPrev,exec, playerctl previous"
          ", XF86AudioStop, exec, playerctl stop"
        ];
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
        exec-once = [
          "hyprctl setcursor Catppuccin-Latte-Dark 16 &"
          "exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "sleep 1 && swww init && sleep 1 && swaylock && notify-send 'Hey $USER, Welcome back' &"
          "wl-paste --type text --watch cliphist store &"
          "wl-paste --type image --watch cliphist store &"
          "waybar &"
          "mako -c /home/xenoxanite/.cache/wal/mako.conf"
          "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1 &"
          "discord --start-minimized &"
        ];
      };
      extraConfig = ''
        general {
          col.active_border = $color2
        }
        windowrule = float, wlogout
        windowrule = noanim, wlogout
        windowrule = float,mpv
        windowrule = move 510 290,mpv
        windowrule = size 900 500,mpv
        windowrule = idleinhibit focus,mpv
        windowrulev2 = idleinhibit focus, class:^(mpv)$
        windowrule = float,imv
        windowrule = move 510 290,imv
        windowrule = size 900 500,imv
        windowrule = float,title:^(Firefox — Sharing Indicator)$
        windowrule = move 0 0,title:^(Firefox — Sharing Indicator)$
        windowrulev2 = float, title:^(Picture-in-Picture)$
        windowrulev2 = opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$
        windowrulev2 = pin, title:^(Picture-in-Picture)$
        windowrulev2 = idleinhibit fullscreen, class:^(firefox)$
        windowrule = size 700 450, pavucontrol
        windowrule = move 40 55%, pavucontrol
        windowrule = float,title:^(Transmission)$
        windowrule = float,title:^(Volume Control)$
        windowrule = float, Nautilus
      '';
    };
  };
}
