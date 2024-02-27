{ inputs, pkgs, lib, ... }: {
  imports = [ inputs.hyprland.homeManagerModules.default ./waybar.nix ./foot.nix ];
  options.hyprland = { enable = lib.mkEnableOption "Enable hyprland"; };
  config = {
    xdg.configFile."wal/templates/colors-hyprland.conf".text =
      "$color1 = rgb({color1.strip})";
    home.packages = with pkgs; [
      mate.mate-polkit
      grimblast
      swww
      wl-clipboard
      cliphist
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mainMod" = "SUPER";
        "$term" = "foot";
        source = [ "/home/xenoxanite/.cache/wal/colors-hyprland.conf" ];
        monitor = [ ",preferred, auto, auto" ];
        input = {
          kb_layout = "us";
          follow_mouse = 2;
          numlock_by_default = 1;
        };
        decoration = {
          rounding = 0;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          fullscreen_opacity = 1.0;
          drop_shadow = false;
          shadow_range = 4;
          shadow_render_power = 3;
          shadow_ignore_window = true;
          dim_inactive = false;
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            new_optimizations = true;
            xray = true;
            ignore_opacity = false;
          };
        };

        general = {
          gaps_in = 4;
          gaps_out = 10;
          border_size = 2;
          layout = "dwindle"; # master|dwindle ;
        };

        misc = {
          disable_autoreload = true;
          disable_hyprland_logo = true;
          always_follow_on_dnd = true;
          layers_hog_keyboard_focus = true;
          animate_manual_resizes = false;
          enable_swallow = true;
          swallow_regex = "";
          focus_on_activate = true;
        };
        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, myBezier, popin 80%"
            "border, 1, 10, myBezier"
            "borderangle, 1, 8, myBezier"
            "fade, 1, 7, myBezier"
            "workspaces, 1, 6, myBezier, slidevert"
            "specialWorkspace, 1, 6, myBezier, slidevert"
          ];
        };
        bind = [
          # terminal
          "$mainMod,Return,exec,$term"
          # rofi
          "$mainMod,Z,exec,rofi -show drun -show-icons -theme ~/.config/rofi/launcher.rasi"
          "$mainMod,C,exec, rofi -show calc -theme ~/.config/rofi/launcher.rasi"
          "$mainMod,X,exec, rofi -show p -modi p:~/.config/rofi/off.sh -theme ~/.config/rofi/launcher.rasi"
          "$mainMod,E,exec, rofi -modi emoji -show emoji -theme ~/.config/rofi/launcher.rasi"
          "$mainMod,V,exec, cliphist list | rofi -dmenu -theme ~/.config/rofi/launcher.rasi | cliphist decode | wl-copy"
          # workspace
          "$mainMod,p,workspace,e-1"
          "$mainMod,n,workspace,e+1"

          # -- Hyprland --
          "$mainMod,Q,killactive,"
          "CTRLALT,Delete,exit,"
          "$mainMod,F,fullscreen,"
          "$mainMod,Space,togglefloating,"
          "$mainMod,Y,pin"
          "$mainMod,W,exec,set-wallpaper"

          # Focus
          "$mainMod,l,movefocus,l"
          "$mainMod,h,movefocus,r"
          "$mainMod,k,movefocus,u"
          "$mainMod,j,movefocus,d"

          # Move
          "$mainMod SHIFT,h,movewindow,l"
          "$mainMod SHIFT,l,movewindow,r"
          "$mainMod SHIFT,k,movewindow,u"
          "$mainMod SHIFT,j,movewindow,d"

          # resize
          "$mainMod CTRL,h,resizeactive,-80 0"
          "$mainMod CTRL,l,resizeactive,80 0"
          "$mainMod CTRL,k,resizeactive,0 -80"
          "$mainMod CTRL,j,resizeactive,0 80"

          # volume control
          ",XF86AudioRaiseVolume,exec, pamixer -i 5"
          ",XF86AudioLowerVolume,exec, pamixer -d 5"
          ",XF86AudioMute,exec, pamixer -t"

          # music control bindings
          ",XF86AudioPlay,exec, playerctl play-pause"
          ",XF86AudioNext,exec, playerctl next"
          ",XF86AudioPrev,exec, playerctl previous"
          ", XF86AudioStop, exec, playerctl stop"
        ] ++ (builtins.concatLists (builtins.genList (x:
          let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
            "ALT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]) 10));

        bindm =
          [ "$mainMod,mouse:272,movewindow" "$mainMod,mouse:273,resizewindow" ];
        windowrule = [
          "workspace 3, ^(firefox)$"
          "workspace 1, title:^(foot)$"
          "workspace 4 silent, ^(discord)$"
          "workspace 5, ^(Spotify)$"
          "float,title:^(Transmission)$"
          "float,title:^(galculator)$"
          "float,title:^(Volume Control)$"
          "float, nemo"
          "float,mpv"
          "move 510 290,mpv"
          "size 900 500,mpv"
          "idleinhibit focus,mpv"
          "float,imv"
          "float, title:^(floating)$"
          "move 510 290,imv"
          "size 900 500,imv"
          "float,title:^(Firefox — Sharing Indicator)$"
          "move 0 0,title:^(Firefox — Sharing Indicator)$"
          "stayfocused, title:^(File Upload)$"
          "stayfocused, Xdg-desktop-portal-gtk"
          "pin, title:^(floating)$"
          "pin, title:^(Picture-in-Picture)$"
          "float, title:^(Picture-in-Picture)$"
        ];
        exec-once = [
          "hyprctl setcursor Catppuccin-Latte-Dark 16 &"
          "exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "wl-paste --type text --watch cliphist store &"
          "wl-paste --type image --watch cliphist store &"
          "waybar &"
          "swww init"
          "dunst &"
          "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1 &"
        ];
      };
      extraConfig = ''
        binds {
         workspace_back_and_forth = 1 
         allow_workspace_cycles = 1
        }
        bind=SUPER,slash,workspace,previous
        general {
          col.active_border = $color1
        }
      '';
    };
  };
}
