{config, ...}: let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  xdg.configFile."/wal/templates/colors-rofi.rasi".text = ''
    * {{
        background: {background};
        background-alt: {color8};
        foreground: {foreground};
        selected: {color2};
    }}
  '';

  programs.rofi.theme = {
    "@import" = "${config.xdg.cacheHome}/wal/colors-rofi.rasi";
    "*" = {
      font = "JetbrainsMono nerd font 12";
    };
    window = {
      transparency = "real";
      location = mkLiteral "center";
      anchor = mkLiteral "center";
      fullscreen = mkLiteral "false";
      width = mkLiteral "600px";
      x-offset = mkLiteral "0px";
      y-offset = mkLiteral "0px";
      enabled = mkLiteral "true";
      margin = mkLiteral "0px";
      padding = mkLiteral "0px";
      border = mkLiteral "0px solid";
      border-radius = mkLiteral "0px";
      border-color = mkLiteral "@selected";
      background-color = mkLiteral "@background";
      cursor = "default";
    };
    mainbox = {
      enabled = mkLiteral "true";
      spacing = mkLiteral "0px";
      margin = mkLiteral "0px";
      padding = mkLiteral "0px";
      border = mkLiteral "0px solid";
      border-radius = mkLiteral "0px 0px 0px 0px";
      border-color = mkLiteral "@selected";
      background-color = mkLiteral "transparent";
      children = map mkLiteral ["inputbar" "listview"];
    };
    inputbar = {
      enabled = mkLiteral "true";
      spacing = mkLiteral "10px";
      margin = mkLiteral "0px";
      padding = mkLiteral "15px";
      border = mkLiteral "0px solid";
      border-radius = mkLiteral "0px";
      border-color = mkLiteral "@selected";
      background-color = mkLiteral "@selected";
      text-color = mkLiteral "@background";
      children = map mkLiteral ["prompt" "entry"];
    };
    prompt = {
      enabled = mkLiteral "true";
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
    };
    textbox-prompt-colon = {
      enabled = mkLiteral "true";
      expand = mkLiteral "false";
      str = "::";
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
    };
    entry = {
      enabled = mkLiteral "true";
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
      cursor = mkLiteral "text";
      placeholder = "Search...";
      placeholder-color = mkLiteral "inherit";
    };
    listview = {
      enabled = mkLiteral "true";
      columns = mkLiteral "1";
      lines = mkLiteral "6";
      cycle = mkLiteral "true";
      dynamic = mkLiteral "true";
      scrollbar = mkLiteral "false";
      layout = mkLiteral "vertical";
      reverse = mkLiteral "false";
      fixed-height = mkLiteral "true";
      fixed-columns = mkLiteral "true";
      spacing = mkLiteral "5px";
      margin = mkLiteral "0px";
      padding = mkLiteral "0px";
      border = mkLiteral "0px solid";
      border-radius = mkLiteral "0px";
      border-color = mkLiteral "@selected";
      background-color = mkLiteral "transparent";
      text-color = mkLiteral "@foreground";
      cursor = mkLiteral "default";
    };
    scrollbar = {
      handle-width = mkLiteral "5px";
      handle-color = mkLiteral "@selected";
      border-radius = mkLiteral "0px";
      background-color = mkLiteral "@background-alt";
    };
    element = {
      enabled = mkLiteral "true";
      spacing = mkLiteral "10px";
      margin = mkLiteral "0px";
      padding = mkLiteral "8px";
      border = mkLiteral "0px solid";
      border-radius = mkLiteral "0px";
      border-color = mkLiteral "@selected";
      background-color = mkLiteral "transparent";
      text-color = mkLiteral "@foreground";
      cursor = mkLiteral "pointer";
    };
    "element normal.normal" = {
      background-color = mkLiteral "@background";
      text-color = mkLiteral "@foreground";
    };
    "element selected.normal" = {
      background-color = mkLiteral "@background-alt";
      text-color = mkLiteral "@foreground";
    };
    element-icon = {
      background-color = mkLiteral "transparent";
      text-color = mkLiteral "inherit";
      size = mkLiteral "32px";
      cursor = mkLiteral "inherit";
    };
    element-text = {
      background-color = mkLiteral "transparent";
      text-color = mkLiteral "inherit";
      highlight = mkLiteral "inherit";
      cursor = mkLiteral "inherit";
      vertical-align = mkLiteral "0.5";
      horizontal-align = mkLiteral "0.0";
    };
    error-message = {
      padding = "20px";
      border = "2px solid";
      border-radius = "0px";
      border-color = "@selected";
      background-color = "@background";
      text-color = "@foreground";
    };
  };

  # programs.rofi.theme = {
  #   "*" = {
  #     width = 600;
  #     font = "JetbrainsMono nerd font 12";
  #   };

  #   "element-text" = {
  #     background-color = mkLiteral "inherit";
  #     text-color = mkLiteral "inherit";
  #   };

  #   "element-icon" = {
  #     background-color = mkLiteral "inherit";
  #     text-color = mkLiteral "inherit";
  #   };
  #   "mode-switcher" = {
  #     background-color = mkLiteral "inherit";
  #     text-color = mkLiteral "inherit";
  #   };
  #   "window" = {
  #     height = mkLiteral "360px";
  #     border = mkLiteral "2px";
  #     border-coloror = mkLiteral "@border-color";
  #     background-color = mkLiteral "@background";
  #   };

  #   "mainbox" = {
  #     background-color = mkLiteral "@background";
  #   };

  #   "inputbar" = {
  #     children = map mkLiteral ["prompt" "entry"];
  #     background-color = mkLiteral "@background";
  #     border-radius = mkLiteral "4px";
  #     padding = mkLiteral "2px";
  #   };

  #   "prompt" = {
  #     background-color = mkLiteral "@foreground";
  #     padding = mkLiteral "6px";
  #     text-color = mkLiteral "@background";
  #     border-radius = mkLiteral "3px";
  #     margin = mkLiteral "20px 0px 0px 20px";
  #   };

  #   "textbox-prompt-colon" = {
  #     expand = false;
  #     str = ":";
  #   };

  #   "entry" = {
  #     padding = mkLiteral "6px";
  #     margin = mkLiteral "20px 0px 0px 10px";
  #     text-color = mkLiteral "@urgent-foreground";
  #     background-color = mkLiteral "@background";
  #   };

  #   "listview" = {
  #     border = mkLiteral "0px 0px 0px";
  #     padding = mkLiteral "6px 0px 0px";
  #     margin = mkLiteral "10px 0px 0px 20px";
  #     columns = 2;
  #     lines = 5;
  #     background-color = mkLiteral "@background";
  #   };

  #   "element" = {
  #     padding = mkLiteral "4px";
  #     background-color = mkLiteral "@background";
  #     text-color = mkLiteral "@urgent-foreground";
  #   };

  #   "element-icon" = {
  #     size = mkLiteral "25px";
  #   };

  #   "element selected" = {
  #     background-color = mkLiteral "@selected-active-background";
  #     text-color = mkLiteral "@selected-active-foreground";
  #   };

  #   "mode-switcher" = {
  #     spacing = 0;
  #   };

  #   "button" = {
  #     padding = mkLiteral "10px";
  #     background-color = mkLiteral "@urgent-background";
  #     text-color = mkLiteral "@selected-urgent-foreground";
  #     vertical-align = mkLiteral "0.5";
  #     horizontal-align = mkLiteral "0.5";
  #   };

  #   "button selected" = {
  #     background-color = mkLiteral "@background";
  #     text-color = mkLiteral "@foreground";
  #   };

  #   "message" = {
  #     background-color = mkLiteral "@urgent-background";
  #     margin = mkLiteral "2px";
  #     padding = mkLiteral "2px";
  #     border-radius = mkLiteral "4px";
  #   };

  #   "textbox" = {
  #     padding = mkLiteral "6px";
  #     margin = mkLiteral "20px 0px 0px 20px";
  #     text-color = mkLiteral "@foreground";
  #     background-color = mkLiteral "@urgent-background";
  #   };
  # };
}
