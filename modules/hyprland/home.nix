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
        "monitor" = ",highrr,auto,auto";
        "source" = "/home/xenoxanite/.cache/wal/colors-hyprland.conf";
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
          animate_manual_resizes = true;
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
      };
      extraConfig = ''
        monitor = ,highres, auto, auto
        source = /home/xenoxanite/.cache/wal/colors-hyprland.conf
        general {
            col.active_border = $color2
        }
        animations {
            enabled=1
            bezier = overshot, 0.13, 0.99, 0.29, 1.1
            animation = windows, 1, 4, overshot, slide
            animation = windowsOut, 1, 4, overshot, slide
            animation = border, 1, 4, overshot
            animation = fade, 1, 4, overshot
            animation = workspaces, 1, 4, overshot
        }

        bind = $mainMod, Q, killactive,
        bind = $mainMod, T, killactive,
        bind = $mainMod, F, fullscreen,
        bind = $mainMod, Space, togglefloating,
        bind = $mainMod, P, pseudo,
        bind = $mainMod, Y, pin,
        bind = $mainMod, J, togglesplit,
        bind = $mainMod, C, exec, hyprctl dispatch centerwindow none
        bind = SUPER, M, movetoworkspace, special
        bind = $mainMod SHIFT, M, togglespecialworkspace
        # shortcut
        bind = $mainMod, Return, exec, alacritty
        bind = $mainMod SHIFT, Return, exec, alacritty --fullscreen
        bind = $mainMod, Z, exec, pkill rofi || rofi -show drun
        bind = $mainMod, W, exec, pkill rofi || wallpaper-picker
        bind = $mainMod, X, exec, pkill wlogout || wlogout -b 4
        bind = SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy
        bind = $mainMod, B, exec, pkill -SIGUSR1 .waybar-wrapped
        bind = $mainMod SHIFT, c ,exec, hyprpicker -a
        # screenshot
        bind = ,Print, exec, grimblast --notify --cursor save area ~/Pictures/screenshots/screenshot_$(date +"%b_%-d_%Y_%H:%M:%S").png
        bind = $mainMod, Print, exec, grimblast --notify --cursor  copy area
        # switch focus
        bind = $mainMod, left, movefocus, l
        bind = $mainMod, right, movefocus, r
        bind = $mainMod, up, movefocus, u
        bind = $mainMod, down, movefocus, d
        # switch workspace
        bind = $mainMod, 1, workspace, 1
        bind = $mainMod, 2, workspace, 2
        bind = $mainMod, 3, workspace, 3
        bind = $mainMod, 4, workspace, 4
        bind = $mainMod, 5, workspace, 5
        bind = $mainMod, 6, workspace, 6
        bind = $mainMod, 7, workspace, 7
        bind = $mainMod, 8, workspace, 8
        bind = $mainMod, 9, workspace, 9
        # same as above, but switch to the workspace
        bind = $mainMod SHIFT, 1, movetoworkspace, 1
        bind = $mainMod SHIFT, 2, movetoworkspace, 2
        bind = $mainMod SHIFT, 3, movetoworkspace, 3
        bind = $mainMod SHIFT, 4, movetoworkspace, 4
        bind = $mainMod SHIFT, 5, movetoworkspace, 5
        bind = $mainMod SHIFT, 6, movetoworkspace, 6
        bind = $mainMod SHIFT, 7, movetoworkspace, 7
        bind = $mainMod SHIFT, 8, movetoworkspace, 8
        bind = $mainMod SHIFT, 9, movetoworkspace, 9
        # window move
        bind = SUPER SHIFT, left, movewindow, l
        bind = SUPER SHIFT, right, movewindow, r
        bind = SUPER SHIFT, up, movewindow, u
        bind = SUPER SHIFT, down, movewindow, d
        # window resize
        bind = SUPER CTRL, left, resizeactive, -80 0
        bind = SUPER CTRL, right, resizeactive, 80 0
        bind = SUPER CTRL, up, resizeactive, 0 -80
        bind = SUPER CTRL, down, resizeactive, 0 80
        # window move position
        bind = SUPER ALT, left, moveactive,  -80 0
        bind = SUPER ALT, right, moveactive, 80 0
        bind = SUPER ALT, up, moveactive, 0 -80
        bind = SUPER ALT, down, moveactive, 0 80
        # media and volume controls
        bind = ,XF86AudioRaiseVolume,exec, pamixer -i 5
        bind = ,XF86AudioLowerVolume,exec, pamixer -d 5
        bind = ,XF86AudioMute,exec, pamixer -t
        bind = ,XF86AudioPlay,exec, playerctl play-pause
        bind = ,XF86AudioNext,exec, playerctl next
        bind = ,XF86AudioPrev,exec, playerctl previous
        bind = , XF86AudioStop, exec, playerctl stop
        bind = $mainMod, mouse_down, workspace, e-1
        bind = $mainMod, mouse_up, workspace, e+1
        # mouse binding
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow
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

        # autostart
        exec-once = hyprctl setcursor Catppuccin-Latte-Dark 16 &
        exec-once = dbus-update-activation-environment --systemd &
        exec-once = sleep 1 && swww init && sleep 1 && swaylock && notify-send 'Hey $USER, Welcome back' &
        exec-once = wl-paste --type text --watch cliphist store &
        exec-once = wl-paste --type image --watch cliphist store &
        exec-once = waybar &
        exec-once = mako -c /home/xenoxanite/.cache/wal/mako.conf
        exec-once = ${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1 &
      '';
    };
  };
}
