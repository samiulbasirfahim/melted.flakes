{
  pkgs,
  config,
  ...
}: let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland-unwrapped;
    theme = {
      "*" = {
        bg-col = mkLiteral "#1e1e2e";
        bg-col-light = mkLiteral "#1e1e2e";
        border-col = mkLiteral "#1e1e2e";
        selected-col = mkLiteral "#1e1e2e";
        blue = mkLiteral "#89b4fa";
        fg-col = mkLiteral "#cdd6f4";
        fg-col2 = mkLiteral "#f38ba8";
        grey = mkLiteral "#6c7086";

        width = 600;
        font = "JetBrainsMono Nerd Font 11";
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
        border = mkLiteral "3px";
        border-color = mkLiteral "@border-col";
        background-color = mkLiteral "@bg-col";
      };

      "mainbox" = {
        background-color = mkLiteral "@bg-col";
      };

      "inputbar" = {
        children = map mkLiteral ["prompt" "entry"];
        background-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "5px";
        padding = mkLiteral "2px";
      };

      "prompt" = {
        background-color = mkLiteral "@blue";
        padding = mkLiteral "6px";
        text-color = mkLiteral "@bg-col";
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
        text-color = mkLiteral "@fg-col";
        background-color = mkLiteral "@bg-col";
      };

      "listview" = {
        border = mkLiteral "0px 0px 0px";
        padding = mkLiteral "6px 0px 0px";
        margin = mkLiteral "10px 0px 0px 20px";
        columns = 2;
        lines = 5;
        background-color = mkLiteral "@bg-col";
      };

      "element" = {
        padding = mkLiteral "5px";
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@fg-col";
      };

      "element-icon" = {
        size = mkLiteral "25px";
      };

      "element selected" = {
        background-color = mkLiteral "@selected-col";
        text-color = mkLiteral "@fg-col2";
      };

      "mode-switcher" = {
        spacing = 0;
      };

      "button" = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "@bg-col-light";
        text-color = mkLiteral "@grey";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };

      "button selected" = {
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@blue";
      };

      "message" = {
        background-color = mkLiteral "@bg-col-light";
        margin = mkLiteral "2px";
        padding = mkLiteral "2px";
        border-radius = mkLiteral "5px";
      };

      "textbox" = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 20px";
        text-color = mkLiteral "@blue";
        background-color = mkLiteral "@bg-col-light";
      };
    };
    extraConfig = {
      modi = "drun";
      icon-theme = "Oranchelo";
      show-icon = true;
      terminal = "alacritty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 﩯  Window";
      display-Network = " 󰤨  Network";
      sidebar-mode = true;
    };
  };
}
