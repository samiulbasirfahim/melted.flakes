{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false; # disable it,autostart it in hyprland conf
      target = "graphical-session.target";
    };
    style = ''
      @import '../../.cache/wal/colors-waybar.css';
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12pt;
        font-weight: bold;
        border-radius: 0px;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      @keyframes blink_red {
        to {
          background-color: rgb(242, 143, 173);
          color: rgb(26, 24, 38);
        }
      }
      .warning,
      .critical,
      .urgent {
        animation-name: blink_red;
        animation-duration: 1s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      window#waybar {
        background-color: transparent;
      }
      window > box {
        margin-left: 0px;
        margin-right: 0px;
        margin-top: 0px;
        border-bottom: 2px solid @color1;
        background-color: @background;
      }
      #workspaces {
        padding-left: 0px;
        padding-right: 4px;
      }
      #workspaces button {
        padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 6px;
        padding-right: 6px;
        color: #d8dee9;
      }
      #workspaces button.active {
        background-color: @color1;
        color: rgb(26, 24, 38);
      }
      #workspaces button.urgent {
        color: rgb(26, 24, 38);
      }
      #workspaces button:hover {
        background-color: #b38dac;
        color: rgb(26, 24, 38);
      }
      tooltip {
        background: #3b4253;
      }
      tooltip label {
        color: #e4e8ef;
      }
      #custom-launcher {
        font-size: 20px;
        padding-left: 8px;
        padding-right: 6px;
        color: #7ebae4;
      }
      #mode,
      #clock,
      #memory,
      #temperature,
      #cpu,
      #mpd,
      #custom-wall,
      #temperature,
      #backlight,
      #pulseaudio,
      #network,
      #battery,
      #custom-powermenu,
      #custom-cava-internal {
        padding-left: 10px;
        padding-right: 10px;
        color: @color1;
      }
      #network.disconnected {
        color: #cccccc;
      }
      #battery.charging,
      #battery.full,
      #battery.discharging {
        color: #cf876f;
      }
      #battery.critical:not(.charging) {
        color: #d6dce7;
      }
      #custom-powermenu {
        color: #bd6069;
      }
      #tray {
        padding-right: 8px;
        padding-left: 10px;
      }
      #tray menu {
        background: #3b4252;
        color: #dee2ea;
      }
      #mpd.paused {
        color: rgb(192, 202, 245);
        font-style: italic;
      }
      #mpd.stopped {
        background: transparent;
      }
      #mpd {
        color: #e4e8ef;
      }
      #custom-cava-internal {
        font-family: "Hack Nerd Font";
      }
    '';
    settings = [{
      "layer" = "top";
      "position" = "top";
      modules-left =
        [ "custom/launcher" "hyprland/workspaces" "custom/cava-internal" ];
      modules-center = [ "clock" ];
      modules-right =
        [ "pulseaudio" "pulseaudio#microphone" "memory" "cpu" "tray" ];
      "custom/launcher" = {
        "format" = " ";
        "on-click" = "pkill rofi || ~/.config/rofi/launcher.sh";
        "tooltip" = false;
      };
      "custom/cava-internal" = {
        "exec" = "sleep 1s && cava-internal";
        "tooltip" = false;
      };
      "hyprland/workspaces" = {
        "format" = "{name}";
        "on-click" = "activate";
        "on-scroll-up" = "hyprctl dispatch workspace e+1";
        "on-scroll-down" = "hyprctl dispatch workspace e-1";
      };
      "pulseaudio" = {
        "scroll-step" = 5;
        "format" = "{icon} {volume}%";
        "format-muted" = "";
        "format-icons" = { "default" = [ "" "" "" ]; };
        "on-click" = "pamixer -t";
      };
      "pulseaudio#microphone" = {
        "format" = "{format_source}";
        "format-source" = " {volume}%";
        "format-source-muted" = "";
        "on-click" = "pamixer --default-source -t";
        "on-scroll-up" = "pamixer --default-source -i 5";
        "on-scroll-down" = "pamixer --default-source -d 5";
        "scroll-step" = 5;
        "on-click-right" = "pavucontrol";
      };
      "clock" = {
        "interval" = 1;
        "format" = "{:%I:%M %p  %A %b %d}";
        "tooltip" = true;
      };
      "memory" = {
        "interval" = 3;
        "format" = " {percentage}%";
        "states" = { "warning" = 85; };
      };
      "cpu" = {
        "interval" = 3;
        "format" = " {usage}%";
      };
      "tray" = {
        "icon-size" = 15;
        "spacing" = 5;
      };
    }];
  };
}
