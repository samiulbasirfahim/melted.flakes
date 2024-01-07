{ pkgs, ... }: {
  home-manager.users.xenoxanite = {
    home.packages = [ pkgs.libnotify pkgs.dunst ];
    xdg.configFile."wal/templates/dunstrc".text = ''
      [global]
          geometry = "3740x5-50+95"
          separator_height = 0
          padding = 24
          horizontal_padding = 24
          frame_color = "{color2}"
          frame_width = 2
          idle_threshold = 120
          font = JetBrainsMono Nerd Font 10
          alignment = center
          word_wrap = yes
          format = "<b>%s</b>: %b"
          markup = full
      [urgency_low]
          background = "{background}"
          foreground = "{color2}"

      [urgency_normal]
          background = "{background}"
          foreground = "{color2}"

      [urgency_critical]
          background = "{background}"
          foreground = "{color1}"
    '';
  };
}
