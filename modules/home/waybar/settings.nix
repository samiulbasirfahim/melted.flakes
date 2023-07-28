{...}: {
  programs.waybar.settings = [
    {
      "layer" = "top";
      "position" = "top";
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
        # "disk"
        "network"
        "tray"
      ];
      "custom/launcher" = {
        "format" = " ";
        "on-click" = "pkill wofi || wofi";
        "tooltip" = false;
      };
      "idle_inhibitor" = {
        "format" = "{icon}";
        "format-icons" = {
          "activated" = "";
          "deactivated" = "";
        };
      };
      "disk" = {
        "path" = "/home";
        "format" = "󰋊 {percentage_used}%";
      };
      "wlr/workspaces" = {
        "format" = "{icon}";
        "on-click" = "activate";
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
        "on-click-middle" = "$HOME/.local/bin/toggle_sound_output";
        "tooltip" = false;
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
        "tooltip" = true;
        "tooltip-format" = "<tt>{calendar}</tt>";
      };
      "memory" = {
        "interval" = 3;
        "format" = "󰟜 {percentage}%";
        "states" = {
          "warning" = 85;
        };
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
        "tooltip" = false;
      };
      "temperature" = {
        "tooltip" = false;
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
}
