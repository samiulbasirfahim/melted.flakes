{
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
    disable_autoreload = false
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
    border_size = 1
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
    # rounding = 2
    rounding = 0
    multisample_edges = true
    blur_new_optimizations = 1
    active_opacity = 0.96
    inactive_opacity = 0.94
    blur = 1
    blur_size = 2
    blur_passes = 2
    drop_shadow = 0
}

animations {
    enabled=1
    bezier = overshot, 0.13, 0.99, 0.29, 1.1
    animation = windows, 1, 4, overshot, slide
    animation = windowsOut, 1, 5, default, popin 80%
    animation = border, 1, 5, default
    animation = fade, 1, 8, default
    animation = workspaces, 1, 6, overshot, slidevert
}


# import files
source = ./keybindings.conf
source = ./windowrules.conf


# autostart
exec-once = hyprctl setcursor Catppuccin-Latte-Dark 16
exec-once = systemctl --user import-environment &
exec-once = hash dbus-update-activation-environment 2>/dev/null &
exec-once = dbus-update-activation-environment --systemd &
exec-once = swww init && sleep 1 && swaylock && notify-send 'Hey $USER, Welcome back' && load-env 
exec-once = wl-paste --type text --watch cliphist store && wl-paste --type image --watch cliphist store && mako &
exec-once = waybar &
    ";
  };
}
