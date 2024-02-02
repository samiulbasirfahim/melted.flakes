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
      .warning, .critical, .urgent {
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
          border-top: 2px solid @color4;
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
      color:@color8;
      }
      #workspaces button.active {
      background-color:@color4;
      color: @color0;
      }
      #workspaces button.urgent {
      color: @color6; 
      }
      #workspaces button:hover {
      background-color: @color5;
      color: @color8;
      }
      tooltip {
      background: @background;
      }
      tooltip label {
      color: #E4E8EF;
      }
      #mode, #clock, #memory, #temperature,#cpu,#mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-cava-internal {
        padding-left: 10px;
        padding-right: 10px;
      }
      #memory, #clock, #cpu, #pulseaudio {
        color: @color4;
      }
      #tray {
      padding-right: 8px;
      padding-left: 10px;
      }
      #tray menu {
      background: #3b4252;
      color: #DEE2EA;
      }
      #mpd.paused {
      color: rgb(192, 202, 245);
      font-style: italic;
      }
      #mpd.stopped {
      background: transparent;
      }
      #mpd {
      color: #E4E8EF;

      /* color: #c0caf5; */
      }
      #custom-cava-internal{
      font-family: "Hack Nerd Font" ;
      }
    '';
    settings = [{
      "layer" = "top";
      "position" = "bottom";
      modules-left = [ "hyprland/workspaces" "mpd" ];
      # modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "memory" "cpu" "clock" "tray" ];
      "custom/launcher" = {
        "format" = " ";
        "on-click" = "pkill rofi || ~/.config/rofi/launcher.sh";
        "tooltip" = false;
      };
      "hyprland/workspaces" = {
        "format" = "{name}";
        "on-click" = "activate";
      };
      "pulseaudio" = {
        "scroll-step" = 1;
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = {
          "default" = [ "" "" "" ];
        };
        "tooltip" = false;
      };
      "clock" = {
        "interval" = 1;
        "format" = "{:%I:%M %p}";
        "tooltip" = true;
        "tooltip-format" = "<tt>{calendar}</tt>";
      };
      "memory" = {
        "interval" = 1;
        "format" = " {percentage}%";
        "states" = { "warning" = 85; };
      };
      "cpu" = {
        "interval" = 1;
        "format" = " {usage}%";
      };
      "mpd" = {
        "max-length" = 25;
        "format" = "<span foreground='#bb9af7'></span> {title}";
        "format-paused" = " {title}";
        "format-stopped" = "<span foreground='#bb9af7'></span>";
        "format-disconnected" = "";
        "on-click" = "mpc --quiet toggle";
        "on-click-right" = "mpc update; mpc ls | mpc add";
        "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp";
        "on-scroll-up" = "mpc --quiet prev";
        "on-scroll-down" = "mpc --quiet next";
        "smooth-scrolling-threshold" = 5;
        "tooltip-format" =
          "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
      };
      "network" = {
        "format-disconnected" = "󰯡 Disconnected";
        "format-ethernet" = "󰀂 {ifname}";
        "format-linked" = "󰖪 {essid}";
        "format-wifi" = "󰖩 {essid}";
        "interval" = 1;
        "tooltip" = false;
      };
      "tray" = {
        "icon-size" = 16;
        "spacing" = 8;
      };
    }];
  };
}
