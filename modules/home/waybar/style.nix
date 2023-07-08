{...}: {
  programs.waybar.style = ''
    * {
        font-family: OperatorMono Nerd Font;
        font-weight: normal;
        font-size: 15px;
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
        border: 2px solid #964B61;
        border-radius: 4px;
        background-color: #1e1e2e;
    }

    #workspaces {
        padding-left: 0px;
        padding-right: 4px;
        border-radius: 0px;
    }

    #workspaces button {
        padding: 4px 6px;
        margin: 3px 0px;
        border-radius: 2px;
    }

    #workspaces button.active {
        background-color: #964B61;
        color: rgb(23, 23, 23);
    }

    #workspaces button.urgent {
        color: #fff000;
    }

    tooltip {
        background: rgb(48, 45, 65);
        border: 2px solid #964B61;
    }

    tooltip label {
        color: rgb(217, 224, 238);
    }

    #custom-launcher {
        font-size: 16px;
        padding-left: 10px;
        padding-right: 6px;
        color: #89B4FA;
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
        color: #B9B9B9;
    }
    #cava {
      padding-left: 10px;
      padding-right: 10px;
    }
    #tray {
        padding-right: 8px;
        padding-left: 10px;
    }
  '';
}
