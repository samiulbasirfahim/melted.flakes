let colors = import ../../../theme/colors.nix { };
in {
  home-manager.users.xenoxanite = {
    programs.kitty = {
      enable = true;
      extraConfig = with colors; ''
        # Eye Friendly Colors
        # Created by https://github.com/decaycs

        # Special
        background #${background}
        foreground #${foreground}

        # Black
        color0 #${black}
        color8 #${brightblack}

        # Red
        color1 #${red}
        color9 #${brightred}

        # Green
        color2  #${green}
        color10 #${brightgreen}

        # Yellow
        color3  #${yellow}
        color11 #${brightyellow}

        # Blue
        color4  #${blue}
        color12 #${brightblue}

        # Magenta
        color5  #${magenta}
        color13 #${brightmagenta}

        # Cyan
        color6  #${cyan}
        color14 #${brightcyan}

        # White
        color7  #${white}
        color15 #${brightwhite}

        # Cursor
        cursor #${white}
        cursor_text_color #${background}

        # Selection highlight
        selection_foreground #${foreground}
        selection_background #${brightblack}
      '';

      settings = {
        font_family = "ComicShannsMono nerd font";
        font_size = 14;
        confirm_os_window_close = 0;
        window_padding_width = 15;
        window_padding_height = 10;
        adjust_line_height = 2;
        adjust_column_width = 0;
        mouse_hide_wait = 0;
        focus_follows_mouse = "no";
        background_opacity = "0.95";
        # Performance
        repaint_delay = 20;
        input_delay = 2;
        sync_to_monitor = "no";

        # Bell
        visual_bell_duration = 0;
        enable_audio_bell = "no";
      };
    };
  };
}
