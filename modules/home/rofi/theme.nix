{config, ...}: let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi.theme."@import" = "${config.xdg.cacheHome}/wal/colors-rofi-dark.rasi";
  programs.rofi.theme = {
    "*" = {
      width = 600;
      font = "JetbrainsMono nerd font 12";
    };

    "element-text" = {
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
    };

    "element-icon" = {
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
    };
    "mode-switcher" = {
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
    };
    "window" = {
      height = mkLiteral "360px";
      border = mkLiteral "2px";
      border-coloror = mkLiteral "@border-color";
      background-color = mkLiteral "@background";
    };

    "mainbox" = {
      background-color = mkLiteral "@background";
    };

    "inputbar" = {
      children = map mkLiteral ["prompt" "entry"];
      background-color = mkLiteral "@background";
      border-radius = mkLiteral "4px";
      padding = mkLiteral "2px";
    };

    "prompt" = {
      background-color = mkLiteral "@foreground";
      padding = mkLiteral "6px";
      text-color = mkLiteral "@background";
      border-radius = mkLiteral "3px";
      margin = mkLiteral "20px 0px 0px 20px";
    };

    "textbox-prompt-colon" = {
      expand = false;
      str = ":";
    };

    "entry" = {
      padding = mkLiteral "6px";
      margin = mkLiteral "20px 0px 0px 10px";
      text-color = mkLiteral "@urgent-foreground";
      background-color = mkLiteral "@background";
    };

    "listview" = {
      border = mkLiteral "0px 0px 0px";
      padding = mkLiteral "6px 0px 0px";
      margin = mkLiteral "10px 0px 0px 20px";
      columns = 2;
      lines = 5;
      background-color = mkLiteral "@background";
    };

    "element" = {
      padding = mkLiteral "4px";
      background-color = mkLiteral "@background";
      text-color = mkLiteral "@urgent-foreground";
    };

    "element-icon" = {
      size = mkLiteral "25px";
    };

    "element selected" = {
      background-color = mkLiteral "@selected-active-background";
      text-color = mkLiteral "@selected-active-foreground";
    };

    "mode-switcher" = {
      spacing = 0;
    };

    "button" = {
      padding = mkLiteral "10px";
      background-color = mkLiteral "@urgent-background";
      text-color = mkLiteral "@selected-urgent-foreground";
      vertical-align = mkLiteral "0.5";
      horizontal-align = mkLiteral "0.5";
    };

    "button selected" = {
      background-color = mkLiteral "@background";
      text-color = mkLiteral "@foreground";
    };

    "message" = {
      background-color = mkLiteral "@urgent-background";
      margin = mkLiteral "2px";
      padding = mkLiteral "2px";
      border-radius = mkLiteral "4px";
    };

    "textbox" = {
      padding = mkLiteral "6px";
      margin = mkLiteral "20px 0px 0px 20px";
      text-color = mkLiteral "@foreground";
      background-color = mkLiteral "@urgent-background";
    };
  };
}
