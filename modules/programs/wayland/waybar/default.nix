{
  nixpkgs.overlays = [
    (final: prev: {
      waybar = prev.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
        postPatch =
          (oldAttrs.postPatch or "")
          + ''
            sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp'';
      });
    })
  ];
  home-manager.users.xenoxanite.programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    settings = [
      {
        layer = "top";
        position = "top";
        modules-left = [
          "custom/launcher"
          "wlr/workspaces"
          "temperature"
          "idle_inhibitor"
          "cava"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "pulseaudio"
          "pulseaudio#microphone"
          "memory"
          "cpu"
          "network"
          "tray"
        ];
        "custom/launcher" = {
          "format" = " ";
          "on-click" = "pkill rofi || rofi -show drun";
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };
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
        "cava" = {
          "framerate" = 30;
          "autosens" = 1;
          "method" = "pulse";
          "bars" = 8;
          "source" = "auto";
          "bar_delimiter" = 0;
          "format-icons" = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
        };
        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰸈 Muted";
          "format-icons" = {
            "default" = ["" "" "󱄠"];
          };
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
          # "format" = "{:%I:%M %p  %A %b %d}";
          "format" = "{:%A %d %b - %I:%M %p}";
          "tooltip-format" = "<tt>{calendar}</tt>";
        };
        "memory" = {
          "interval" = 3;
          "format" = "󰟜 {percentage}%";
        };
        "cpu" = {
          "interval" = 3;
          "format" = "⠀{usage}%";
        };
        "network" = {
          "interval" = 1;
          "format" = "󰣺 Connected";
          "format-alt" = " {bandwidthUpBytes} -  {bandwidthDownBytes}";
          "format-disconnected" = "󰣼 Disconnected";
        };
        "temperature" = {
          "thermal-zone" = 2;
          "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
          "format" = " {temperatureC}°C";
        };
        "tray" = {
          "icon-size" = 12;
          "spacing" = 5;
        };
      }
    ];

    style = "

@import '../../.cache/wal/colors-waybar.css';
* {
  font-family: JetbrainsMono nerd font;
  font-weight: bold;
  font-size: 14px;
  min-height: 0;
  transition-property: background-color;
  transition-duration: 0.5s;
  transition: all linear 0.5s;
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
window>box {
  margin-left: 20px;
  margin-right: 20px;
  margin-top: 12px;
  border: 3px solid @color2;
  border-radius: 1px;
  background-color: @background;
}
#workspaces {
  padding: 0px;
}
#workspaces button {
  padding: 4px 6px;
  margin: 4px 2px;
  border-radius: 50%;
  background-color: @background;
  color: @foreground;
}
#workspaces button.active {
  background-color: @color2;
  border-radius: 2px;
  color: @foreground;
}
#workspaces button:hover {
  color: @color2;
  background: @background;
  border: 0px solid @color2;
  box-shadow: inherit;
  text-shadow: inherit;
}
#workspaces button.active:hover {
  background-color: @color2;
  color: @foreground;
}
tooltip {
  background-color: @background;
  border-radius: 0px;
  border: 2px solid @color2;
}
tooltip label {
  color: @foreground;
}
#custom-launcher {
  font-size: 16px;
  padding-left: 10px;
  padding-right: 6px;
  color: @color2;
}
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
#disk,
#idle_inhibitor
{
  padding-left: 8px;
  padding-right: 8px;
  color: @foreground;
}

#cava {
  margin-left: 10px;
  color: @color2;
}

#memory, #cpu, #clock, #pulseaudio, #network {
  background-color: @color2;
  border-radius: 2px;
  padding: 0px 8px;
  margin: 4px;
  color: @background;
}

#tray {
  margin: 0px 10px 0px 4px;
}

#memory {
  border-radius: 2px 0px 0px 2px;
  margin-right: 0px;
}

#cpu {
  border-radius: 0px 2px 2px 0px;
  margin-left: 0px;
}

#pulseaudio {
  border-radius: 2px 0px 0px 2px;
  margin-right: 0px;
}

#pulseaudio.microphone {
  border-radius: 0px 2px 2px 0px;
  margin-left: 0px;
  margin-right: 4px;
}
    ";
  };
}
