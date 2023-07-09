{...}: {
  wayland.windowManager.hyprland = {
    extraConfig = "
$mainMod = SUPER
monitor = ,preffered,auto,auto
input {
    kb_layout = us
    numlock_by_default = true
    follow_mouse = 1
    sensitivity = 0
}

misc {
    disable_autoreload = true
    disable_hyprland_logo = true
    always_follow_on_dnd = true
    layers_hog_keyboard_focus = true
    animate_manual_resizes = false
    enable_swallow = true
    focus_on_activate = true
}

general {
    gaps_in = 6
    gaps_out = 10
    border_size = 2
    col.active_border = 0xaaeb6f92
    col.inactive_border = 0xaa6e6a86
    apply_sens_to_raw = 1
    layout = dwindle
}

dwindle {
    pseudotile = yes
    preserve_split = yes
}

master {
    new_is_master = true
}

decoration {
    rounding = 2
    multisample_edges = true
    blur_new_optimizations = 1
    active_opacity = 0.94
    inactive_opacity = 0.92
    blur = 1
    blur_size = 2
    blur_passes = 2
    drop_shadow = 0
}

animations {
    enabled = yes
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, myBezier, popin 80%
    animation = border, 1, 10, myBezier
    animation = borderangle, 1, 8, myBezier
    animation = fade, 1, 7, myBezier
    animation = workspaces, 1, 6, myBezier
}

# import files
source = ./keybindings.conf
source = ./windowrules.conf


# autostart
exec-once = hyprctl setcursor Catppuccin-Latte-Dark 16
exec-once = systemctl --user import-environment &
exec-once = hash dbus-update-activation-environment 2>/dev/null &
exec-once = dbus-update-activation-environment --systemd &
exec-once = swww init && sleep 0.5 && swaylock && notify-send 'Hey $USER, Welcome back' && load-env 
exec-once = wl-paste --type text --watch cliphist store && wl-paste --type image --watch cliphist store && mako &
exec-once = waybar &
    ";
  };
}
