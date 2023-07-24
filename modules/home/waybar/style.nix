{...}: {
  programs.waybar.style = ''
    @import '../../.cache/wal/colors-waybar.css';

    * {
        font-family: JetbrainsMono nerd font;
        font-weight: normal;
        font-size: 14px;
        min-height: 0;
        transition-property: background-color;
        transition-duration: 0.5s;
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
        color: #1e1e2e;
    }

    #workspaces button.urgent {
        color: @color14;
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
  '';
}
