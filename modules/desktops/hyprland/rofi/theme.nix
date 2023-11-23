{
  home-manager.users.xenoxanite = { config, ... }:
    let inherit (config.lib.formats.rasi) mkLiteral;
    in {
      xdg.configFile."rofi/themes/dark-decay.rasi".text = ''
        * {
            bg-col:  #101419;
            bg-col-light: #101419;
            border-col: #8cc1ff;
            selected-col: #1f2329;
            blue: #8cc1ff;
            fg-col: #b6beca;
            fg-col2: #b6beca;
            grey: #1f2329;
            width: 600;
        }
      '';

      /* xdg.configFile."wal/templates/colors-rofi.rasi".text = ''
              * {{
                  background:     {background};
                  background-alt: {color1};
                  foreground:     {foreground};
                  selected:       {color2};
              }}
            '';
            programs.rofi.theme = {
              "@import" = "${config.xdg.cacheHome}/wal/colors-rofi.rasi";
              "*" = {
                font = "ComicShannsMono nerd font 12";
                font-weight = mkLiteral "bold";
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
                children = map mkLiteral [ "inputbar" "listview" ];
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
                children = map mkLiteral [ "prompt" "entry" ];
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
              textbox = {
                background-color = mkLiteral "@background";
                text-color = mkLiteral "@foreground";
                vertical-align = mkLiteral "0.5";
                horizontal-align = mkLiteral "0.0";
                highlight = mkLiteral "none";
              };
            };
      */
    };
}
