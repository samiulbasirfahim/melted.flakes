{
  nixpkgs.overlays = [
    (final: prev: {
      waybar = prev.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        postPatch = (oldAttrs.postPatch or "") + ''
          sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp'';
      });
    })
  ];
  home-manager.users.xenoxanite = {
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
      settings = [{
        layer = "top";
        position = "top";
        modules-left = [ "clock" "custom/cava-internal" ];
        modules-center = [ "wlr/workspaces" ];
        modules-right =
          [ "network" "pulseaudio" "pulseaudio#microphone" "tray" ];
        "wlr/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "format-icons" = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
        };
        "custom/cava-internal" = {
          "exec" = "sleep 1s && cava-internal";
          "tooltip" = false;
        };
        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰸈 Muted";
          "format-icons" = { "default" = [ "" "" "󱄠" ]; };
          "on-click" = "pamixer -t";
          "on-click-right" = "pavucontrol";
        };
        "pulseaudio#microphone" = {
          "format" = "{format_source}";
          "format-source" = "󰍬 {volume}%";
          "format-source-muted" = "󰍭 Muted";
          "on-click" = "pamixer --default-source -t";
          "on-scroll-up" = "pamixer --default-source -i 5";
          "on-scroll-down" = "pamixer --default-source -d 5";
          "scroll-step" = 5;
          "on-click-right" = "pavucontrol";
        };
        "clock" = {
          "interval" = 1;
          "format" =
            "<span font='11.5'>󰥔</span> {:%H:%M:%S  <span font='11.5'>󰃮</span> %e %b}";
          "tooltip-format" = "<tt>{calendar}</tt>";
        };
        "memory" = {
          "interval" = 3;
          "format" = " {percentage}%";
        };
        "cpu" = {
          "interval" = 3;
          "format" = " {usage}%";
        };
        "network" = {
          "interval" = 1;
          "format" = " {bandwidthUpBytes}  {bandwidthDownBytes}";
        };
        "tray" = {
          "icon-size" = 12;
          "spacing" = 5;
        };
      }];
      style = ''
        @import '../../.cache/wal/colors-waybar.css';

        * {
            font-family: Maple Mono;
            font-weight: 400;
            font-size: 14px;
        }

        window#waybar {
            opacity: 0.9;
            background-color: #000000;
        }

        #clock {
            margin: 0px 15px;
            padding: 0px 4px;
            color: @color13;
            border-bottom: 2px solid @color13;
        }

        #custom-cava-internal,
        #network {
            margin: 0 15px 0 0;
            padding: 0px 4px;
            color: @color13;
            border-bottom: 2px solid @color13;
        }

        #custom-cava-internal {
            border: 0;
        }

        #pulseaudio,
        #memory {
            margin: 0;
            padding: 0px 4px;
            color: @color13;
            border-bottom: 2px solid @color13;
        }

        #pulseaudio.microphone,
        #cpu {
            margin: 0 15px 0 0;
            padding: 0px 4px;
            color: @color13;
            border-bottom: 2px solid @color13;
        }

        #tray {
            margin: 0 15px 0 0;
            padding: 0px 8px;
            color: @color13;
            border-bottom: 2px solid @color13;
        }

        #workspaces {
            border-bottom: 2px solid @color13;
        }

        #workspaces button {
            color: @color13;
        }

        #workspaces button.active {
            border-top: 2px solid @color13;
            border-radius: 0px;
            padding-top: 0px;
        }

        #workspaces button:hover {
            color: @color13;
            background: #000000;
            border: 0;
        }

        #workspaces button.active:hover {
            background-color: #000000;
            border-bottom: 2px solid @color13;
            border-top: 2px solid @color13;
        }

        tooltip {
            background-color: #000000;
            opacity: 0.7;
            border-radius: 0px;
            border: 2px solid @color13;
        }
      '';
    };
  };
}
