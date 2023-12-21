{
  home-manager.users.fahim = {
    xdg.configFile."btop/btop.conf".text = ''
      color_theme = "TTY"
      theme_background = False
      truecolor = True
      force_tty = False
      vim_keys = True
      rounded_corners = False
    '';
  };
}
