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
        bold_italic_font = "auto";
        mouse_hide_wait = 2;
        cursor_shape = "block";
        url_color = "#0087bd";
        url_style = "dotted";
        confirm_os_window_close = 0;
        background_opacity = "0.9";
      };
      extraConfig = ''
        include ~/.cache/wal/colors-kitty.conf
      '';
    };
  };
}
