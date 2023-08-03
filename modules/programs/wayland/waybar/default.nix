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
          "format" = "{:%I:%M %p  %A %b %d}";
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
  margin-left: 10px;
  margin-right: 10px;
  margin-top: 8px;
  border: 2px solid @color2;
  border-radius: 0px;
  background-color: @background;
}
#workspaces {
  padding-left: 0px;
  padding-right: 4px;
  border-radius: 0px;
}
#workspaces button {
  padding: 4px 6px;
  margin: 3px 0px;
  border-radius: 0px;
}
#workspaces button.active {
  background-color: @color2;
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
  color: @foreground;
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
#idle_inhibitor {
  padding-left: 10px;
  padding-right: 10px;
  padding-top: 0px;
  padding-bottom: 0px;
  color: @foreground;
}
#tray {
  padding-right: 8px;
  padding-left: 10px;
}
    ";
  };
}
