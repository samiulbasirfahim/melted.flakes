{ pkgs, ... }:
let
  myswaylock = pkgs.writeShellScriptBin "myswaylock" ''
    ${pkgs.swaylock-effects}/bin/swaylock  \
           --screenshots \
           --clock \
           --indicator \
           --indicator-radius 100 \
           --indicator-thickness 7 \
           --effect-blur 7x5 \
           --effect-vignette 0.5:0.5 \
           --ring-color 3b4252 \
           --key-hl-color 880033 \
           --line-color 00000000 \
           --inside-color 00000088 \
           --separator-color 00000000 \
           --grace 2 \
           --fade-in 0.3
  '';
  launch_waybar = pkgs.writeShellScriptBin "launch_waybar" ''
    killall .waybar-wrapped
    ${pkgs.waybar}/bin/waybar > /dev/null 2>&1 &
  '';
in {
  imports = [ ../../programs/waybar ];
  xdg.configFile."wal/templates/colors-hyprland.conf".text =
    "$color4 = rgb({color4.strip})";
  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";
      "$term" = "kitty";
      monitor = [ ",highres, auto, auto" ",highrr, auto, auto" ];
      input = {
        kb_layout = "us";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
      };
      source = [ "/home/xenoxanite/.cache/wal/colors-hyprland.conf" ];
      misc = {
        vfr = true;
        vrr = 0;
        layers_hog_keyboard_focus = true;
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        disable_splash_rendering = true;
        animate_mouse_windowdragging = false;
      };
      general = {
        gaps_in = 8;
        gaps_out = 13;
        border_size = 2;
        apply_sens_to_raw = 1;
        layout = "master";
      };

      decoration = {
        rounding = 0;
        active_opacity = 0.96;
        inactive_opacity = 0.96;
        drop_shadow = false;
        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          new_optimizations = true;
          xray = true;
        };
      };
      animations = {
        enabled = true;
        bezier = "overshot, 0.13, 0.99, 0.29, 1.1";
        animation = [
          "windows, 1, 4, default, slide"
          "windowsOut, 1, 4, default, slide"
          "border, 1, 4, overshot"
          "fade, 1, 4, overshot"
          "workspaces, 1, 4, overshot, slide"
          "specialWorkspace, 1, 4, overshot, slidevert"
        ];
      };
      master = {
        mfact = 0.75;
        orientation = "left";
        always_center_master = true;
      };
      bind = [
        # workspace
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"

        # move to workspace
        "$mainModSHIFT, 1, movetoworkspace, 1"
        "$mainModSHIFT, 2, movetoworkspace, 2"
        "$mainModSHIFT, 3, movetoworkspace, 3"
        "$mainModSHIFT, 4, movetoworkspace, 4"
        "$mainModSHIFT, 5, movetoworkspace, 5"
        "$mainModSHIFT, 6, movetoworkspace, 6"
        "$mainModSHIFT, 7, movetoworkspace, 7"
        "$mainModSHIFT, 8, movetoworkspace, 8"
        "$mainModSHIFT, 9, movetoworkspace, 9"

       "$mainMod CTRL, L, workspace, +1"
       "$mainMod CTRL, H, workspace, -1"
        # move between workspace
        "$mainMod, H, workspace, e-1"
        "$mainMod, L, workspace, e+1"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # special workspaces
        "$mainMod, minus, movetoworkspace, special"
        "$mainMod, equal, togglespecialworkspace, default"

        # move focus
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"

        # window resize bindings
        "CTRL SHIFT, h, resizeactive, -100 0"
        "CTRL SHIFT, l, resizeactive, 100 0"
        "CTRL SHIFT, k, resizeactive, 0 -100"
        "CTRL SHIFT, j, resizeactive, 0 100"

        # window reposition bindings
        "$mainModSHIFT, h, moveactive,  -100 0"
        "$mainModSHIFT, l, moveactive, 100 0"
        "$mainModSHIFT, k, moveactive, 0 -100"
        "$mainModSHIFT, j, moveactive, 0 100"

        # volume control
        ",XF86AudioRaiseVolume,exec, pamixer -i 5"
        ",XF86AudioLowerVolume,exec, pamixer -d 5"
        ",XF86AudioMute,exec, pamixer -t"

        "SHIFT, F4,exec, pamixer --default-source -t"
        "SHIFT, F3, exec, pamixer --default-source -i 5"
        "SHIFT, F2, exec, pamixer --default-source -d 5"

        # music control
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop, exec, playerctl stop"

        # shortcut
        "$mainMod, Return, exec, $term"
        "$mainModSHIFT, Return, exec, $term --title termfloat -e tmux new-session -A -s xenox"
        "$mainMod, Z, exec, pkill rofi || ~/.config/rofi/launcher.sh"
        "$mainMod, X, exec, pkill rofi || bash ~/.config/rofi/powermenu.sh"
        "$mainMod, W, exec, pkill sxiv || set-wallpaper"
        "$mainMod, V, exec, cliphist list | rofi -dmenu -theme ~/.config/rofi/config-2.rasi | cliphist decode | wl-copy"
        "$mainMod, B, exec, pkill -SIGUSR1 .waybar-wrapped &"
        "$mainModSHIFT, c ,exec, hyprpicker -a"

        # basic controll
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen,"
        "$mainModSHIFT, Space, togglefloating,"
        "$mainMod, P, pin,"
        "$mainMod, Y, fakefullscreen,"
        "$mainMod, T, togglesplit,"
        "$mainMod, C, exec, hyprctl dispatch centerwindow none"

        "$mainMod,period,layoutmsg,swapwithmaster"
        "$mainMod,A,layoutmsg,addmaster"
        "$mainMod,S,layoutmsg,removemaster"

        # screenshots bindings
        ''
          ,Print, exec, grimblast --notify --cursor save area ~/Pictures/screenshots/screenshot_$(date +"%b_%-d_%Y_%H:%M:%S").png''
        "$mainMod, Print, exec, grimblast --notify --cursor  copy area"

      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      exec-once = [
        "hyprctl setcursor Catppuccin-Latte-Dark 16 &"
        "dbus-update-activation-environment --systemd &"
        "swww init"
        "wl-paste --type text --watch cliphist store &"
        "wl-paste --type image --watch cliphist store &"
        "mako -c /home/xenoxanite/.cache/wal/mako.conf"
        "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1 &"
      ];
    };
    extraConfig = ''
        general {
            col.active_border = $color4
            col.inactive_border = "rgba(000000ee)";
        }

      decoration {
        rounding = 0
        active_opacity = 1.0
        inactive_opacity = 1.0
        fullscreen_opacity = 1.0
        drop_shadow = false
      }

      binds {
           workspace_back_and_forth = 1 
           allow_workspace_cycles = 1
      }
      bind=$mainMod,slash,workspace,previous

      exec-once = ${launch_waybar}/bin/launch_waybar &
      exec-once = swayidle -w timeout 300 'systemctl suspend' before-sleep '${myswaylock}/bin/myswaylock'

      #`hyprctl clients` get class、title...
      windowrule=float,title:^(Picture-in-Picture)$
      windowrule=size 960 540,title:^(Picture-in-Picture)$
      windowrule=move 25%-,title:^(Picture-in-Picture)$
      windowrule=float,imv
      windowrule=move 25%-,imv
      windowrule=size 960 540,imv
      windowrule=float,mpv
      windowrule=move 25%-,mpv
      windowrule=size 960 540,mpv
      windowrule=float,danmufloat
      windowrule=move 25%-,danmufloat
      windowrule=pin,danmufloat
      windowrule=rounding 5,danmufloat
      windowrule=size 960 540,danmufloat
      windowrule=float, termfloat
      windowrule=move 25%-, termfloat
      windowrule=size 960 540, termfloat
      windowrule=float,nemo
      windowrule=move 25%-,nemo
      windowrule=size 960 540,nemo
      windowrule=float,ncmpcpp
      windowrule=move 25%-,ncmpcpp
      windowrule=size 960 540,ncmpcpp
      windowrule=noblur,^(firefox)$
    '';
  };
}
