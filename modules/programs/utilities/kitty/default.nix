{
  home-manager.users.xenoxanite = {
    programs.kitty = {
      enable = true;
      settings = {
        font_family = "ComicShannsMono nerd font";
        italic_font = "auto";
        bold_font = "auto";
        bold_italic_font = "auto";
        font_size = 14;
        disable_ligatures = "never";
        confirm_os_window_close = 0;
        window_padding_width = 0;
        window_padding_height = 0;
        adjust_line_height = 0;
        adjust_column_width = 0;
        box_drawing_scale = "0.01, 0.8, 1.5, 2";
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

        #color
        include = "~/.config/kitty/dark-decay.ini";

      };
    };
    xdg.configFile."kitty/dark-decay.ini".text = ''

      cursor_shape          Underline
      cursor_underline_thickness 1
      window_padding_width  20

      # Special
      foreground #b6beca
      background #101419

      # Black
      color0 #1c252c
      color8 #384148

      # Red
      color1 #e05f65
      color9 #fc7b81

      # Green
      color2  #78dba9
      color10 #94f7c5

      # Yellow
      color3  #f1cf8a
      color11 #ffeba6

      # Blue
      color4  #70a5eb
      color12 #8cc1ff

      # Magenta
      color5  #c68aee
      color13 #e2a6ff

      # Cyan
      color6  #74bee9
      color14 #90daff

      # White
      color7  #dee1e6
      color15 #fafdff

      # Cursor
      cursor #f5f5f5
      cursor_text_color #a9b1d6

      # Selection highlight
      selection_foreground #a9b1d6
      selection_background #22262e
    '';
  };
}
