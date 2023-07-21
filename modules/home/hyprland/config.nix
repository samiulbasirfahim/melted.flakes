{
  wayland.windowManager.hyprland = {
    extraConfig = "
$mainMod = SUPER
monitor = ,highres, auto, auto
monitor = ,highrr,auto,auto

# import files
source = ./keybindings.conf
source = ./windowrules.conf
source = /home/xenoxanite/.cache/wal/colors-hyprland.conf

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
    border_size = 3
    col.active_border = $color2
    col.inactive_border = rgba(000000ee) 
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
    active_opacity = 0.9
    inactive_opacity = 0.9
    blur = 1
    blur_size = 1
    blur_passes = 3
    drop_shadow = 0
}

animations {
    enabled=1
    bezier = overshot, 1, 1, 1, 1
    animation = windows, 1, 2, overshot, slide
    animation = windowsOut, 1, 2, overshot, popin 80%
    animation = border, 1, 2, overshot
    animation = fade, 1, 2, overshot
    animation = workspaces, 1, 2, overshot, slidevert
}





# autostart
exec-once = hyprctl setcursor Catppuccin-Latte-Dark 16
exec-once = systemctl --user import-environment &
exec-once = hash dbus-update-activation-environment 2>/dev/null &
exec-once = dbus-update-activation-environment --systemd &
exec-once = /nix/store/$(ls -la /nix/store | grep 'mate-polkit' | grep '4096' | awk '{print $9}' | sed -n '$p')/libexec/polkit-mate-authentication-agent-1 & 
exec-once = swww init && sleep 1 && swaylock && notify-send 'Hey $USER, Welcome back' && load-env 
exec-once = wl-paste --type text --watch cliphist store
exec-once = wl-paste --type image --watch cliphist store
exec-once = waybar &
exec-once = mako -c /home/xenoxanite/.cache/wal/mako.conf
    ";
  };
}
