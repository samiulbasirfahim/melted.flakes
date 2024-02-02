{
  programs = {
    kitty = {
      enable = true;
      environment = { };
      keybindings = { };
      font.name = "jetbrains mono nerd font";
      font.size = 15;
      settings = {
        italic_font = "auto";
        bold_font = "auto";
        bold_italic_font = "auto";
        font_size = 14;
        disable_ligatures = "never";
        confirm_os_window_close = 0;
        window_padding_width = 8;
        adjust_line_height = 0;
        adjust_column_width = 0;
        mouse_hide_wait = 0;
        focus_follows_mouse = "no";
        background_opacity = "0.8";
        # Performance
        repaint_delay = 20;
        input_delay = 2;
        sync_to_monitor = "no";

        # Bell
        visual_bell_duration = 0;
        enable_audio_bell = "no";

        #color
        include = "~/.cache/wal/colors-kitty.conf";
      };
    };
  };
}
