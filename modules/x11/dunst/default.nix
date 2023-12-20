{ config, pkgs, ... }:
let ui = import ./../../theme/ui.nix { };
in {

  home-manager.users.xenoxanite = {
    home.packages = [ pkgs.libnotify ];
    services.dunst = {
      package = pkgs.dunst;
      enable = true;
      settings = with ui.colors; {
        global = {
          font = ui.nerd-font;
          font-size = 9;
          markup = "full";
          format = ''
            %s
            %b'';
          sort = "no";
          indicate_hidden = "yes";
          alignment = "left";
          show_age_threshold = 60;
          word_wrap = "yes";
          ignore_newline = "no";
          stack_duplicates = "false";
          hide_duplicate_count = "yes";
          corner_radius = ui.border-radius;
          width = "320";
          height = "50-10";
          offset = "12x50";
          shrink = "no";
          idle_threshold = 120;
          monitor = 0;
          follow = "mouse";
          sticky_history = "yes";
          history_length = 20;
          show_indicators = "no";
          line_height = 4;
          separator_height = 4;
          padding = 20;
          horizontal_padding = 20;
          separator_color = "auto";
          startup_notification = "true";
          browser = "x-www-browser -new-tab";
          always_run_script = "true";
          title = "Dunst";
          class = "Dunst";
          icon_position = "left";
          min_icon_size = "32";
          max_icon_size = "56";
          frame_width = ui.border-size;
        };

        shortcuts = {
          close = "ctrl+shift+space";
          close_all = "ctrl+shift+space";
          history = "ctrl+grave";
          context = "ctrl+shift+period";
        };

        urgency-normal = {
          frame_color = "#${green}";
          foreground = "#${blue}";
          background = "#${background}";
          timeout = 5;

          /* frame_color = "#89b4fa";
             foreground = "#89b4fa";
             background = "#181825";
             timeout = 5;
          */
        };

        urgency-critical = {
          frame_color = "#${red}";
          foreground = "#${red}";
          background = "#${background}";
          timeout = 5;

          /* frame_color = "#f38ba8";
             foreground = "#f38ba8";
             background = "#181825";
             timeout = 5;
          */
        };
      };
    };
  };
}
