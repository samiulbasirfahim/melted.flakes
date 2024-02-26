{ inputs, pkgs, lib, ... }: {
  imports = [ inputs.hyprland.homeManagerModules.default ./waybar.nix ];
  options.hyprland = { enable = lib.mkEnableOption "Enable hyprland"; };
  config = {
    home.packages = with pkgs; [ swww cava ];
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = ''
        monitor=,preferred,auto,1 
        input {
          kb_layout=us
          kb_variant=
          kb_model=
          kb_options=
          kb_rules=
          follow_mouse=2    
          natural_scroll=0
          force_no_accel=0
          # repeat_rate=
          # repeat_delay=
          numlock_by_default=1
        }

        #-- Decoration ----------------------------------------------------
        decoration {
          rounding = 0
          active_opacity = 1.0
          inactive_opacity = 1.0
          fullscreen_opacity = 1.0
          drop_shadow = false
          shadow_range = 4
          shadow_render_power = 3
          shadow_ignore_window = true
          dim_inactive = false
          col.shadow = rgba(1a1a1aee)
          blur {
            enabled = true
            size = 3
            passes = 1
            new_optimizations = true
            xray = true
            ignore_opacity = false
          }
        }
        general {
          gaps_in = 4
          gaps_out = 10
          border_size = 2
          col.active_border = rgb(81a1c1)
          col.inactive_border = rgba(595959aa)

          layout = dwindle # master|dwindle 
        }
        master {
          new_is_master = true
          special_scale_factor = 0.8
          new_is_master = true
          no_gaps_when_only = false
        }
        misc {
          # disable_autoreload = true
          disable_hyprland_logo = true
          always_follow_on_dnd = true
          layers_hog_keyboard_focus = true
          animate_manual_resizes = false
          enable_swallow = true
          swallow_regex =
          focus_on_activate = true
        }
        #-- Animations ----------------------------------------------------
        animations {
          enabled=1
          bezier = overshot, 0.13, 0.99, 0.29, 1.1
          animation = windows, 1, 4, overshot, slide
          animation = windowsOut, 1, 5, default, popin 80%
          animation = border, 1, 5, default
          animation = fade, 1, 8, default
          animation = workspaces, 1, 6, overshot, slidevert
        }

        #-- Keybindings ----------------------------------------------------
        $term = foot 

        # -- Terminal --
        bind=SUPER,Return,exec,$term

        # -- Shortcut --
        bind=SUPER,Z,exec,rofi -show drun -show-icons -theme ~/.config/rofi/launcher.rasi
        bind=SUPER,W,exec,set-wallpaper

        # -- Some nice mouse binds --
        bindm=SUPER,mouse:272,movewindow
        bindm=SUPER,mouse:273,resizewindow

        # -- Function keys --

        # -- Screenshots --

        # -- Hyprland --
        bind=SUPER,Q,killactive,
        bind=SUPER,C,killactive,
        bind=CTRLALT,Delete,exit,
        bind=SUPER,F,fullscreen,
        bind=SUPER,Space,togglefloating,
        bind=SUPER,Y,pin

        # Focus
        bind=SUPER,l,movefocus,l
        bind=SUPER,h,movefocus,r
        bind=SUPER,k,movefocus,u
        bind=SUPER,j,movefocus,d

        # Move
        bind=SUPERSHIFT,h,movewindow,l
        bind=SUPERSHIFT,l,movewindow,r
        bind=SUPERSHIFT,k,movewindow,u
        bind=SUPERSHIFT,j,movewindow,d

        # Resize
        bind=SUPERCTRL,h,resizeactive,-80 0
        bind=SUPERCTRL,l,resizeactive,80 0
        bind=SUPERCTRL,k,resizeactive,0 -80
        bind=SUPERCTRL,j,resizeactive,0 80

        # Workspaces
        bind=SUPER,1,workspace,1
        bind=SUPER,2,workspace,2
        bind=SUPER,3,workspace,3
        bind=SUPER,4,workspace,4
        bind=SUPER,5,workspace,5
        bind=SUPER,6,workspace,6
        bind=SUPER,7,workspace,7
        bind=SUPER,8,workspace,8
        bind=SUPER,9,workspace,9
        bind=SUPER,0,workspace,10

        # Send to Workspaces
        bind=ALT,1,movetoworkspace,1
        bind=ALT,2,movetoworkspace,2
        bind=ALT,3,movetoworkspace,3
        bind=ALT,4,movetoworkspace,4
        bind=ALT,5,movetoworkspace,5
        bind=ALT,6,movetoworkspace,6
        bind=ALT,7,movetoworkspace,7
        bind=ALT,8,movetoworkspace,8
        bind=ALT,9,movetoworkspace,9
        bind=ALT,0,movetoworkspace,10

        bind=SUPER,p,workspace,e-1
        bind=SUPER,n,workspace,e+1

        binds {
         workspace_back_and_forth = 1 
         allow_workspace_cycles = 1
        }
        bind=SUPER,slash,workspace,previous
      '';
    };
  };
}
