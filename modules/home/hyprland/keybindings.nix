{
  xdg.configFile."hypr/keybindings.conf".text = ''
    # basic
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
  '';
}
