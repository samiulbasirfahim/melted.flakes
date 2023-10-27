{ pkgs, ... }:

{
  home-manager.users.xenoxanite = {
    programs.kitty = {
      enable = true;
      settings = {
        font_family = "Maple Mono";
        italic_font = "auto";
        bold_font = "auto";
        bold_italic_font = "auto";
        font_size = 14;
        disable_ligatures = "never";
        confirm_os_window_close = 0;
        window_padding_width = 14;
        adjust_line_height = 0;
        adjust_column_width = 0;
        box_drawing_scale = "0.01, 0.8, 1.5, 2";
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
    xdg.configFile."wal/templates/colors-kitty.conf".text = ''
      foreground         {foreground}
      background         #000000
      cursor             {cursor}

      active_tab_foreground     #000000
      active_tab_background     {foreground}
      inactive_tab_foreground   {foreground}
      inactive_tab_background   #000000

      active_border_color   {foreground}
      inactive_border_color #000000
      bell_border_color     {color1}

      color0       {color0}
      color8       {color8}
      color1       {color1}
      color9       {color9}
      color2       {color2}
      color10      {color10}
      color3       {color3}
      color11      {color11}
      color4       {color4}
      color12      {color12}
      color5       {color5}
      color13      {color13}
      color6       {color6}
      color14      {color14}
      color7       {color7}
      color15      {color15}
    '';
  };
}
