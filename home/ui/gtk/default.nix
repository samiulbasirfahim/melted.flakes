{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home = {
    pointerCursor = {
      package = pkgs.cattpuccin-dark-cursor;
      name = "Catppuccin-Latte-Dark";
      size = 12;
    };

    sessionVariables = {
      GTK_USE_PORTAL = 0;
      QT_QPA_PLATFORMTHEME = "gtk3";
      GTK_THEME = "Nordic";
    };

    pointerCursor.gtk.enable = true;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk2.extraConfig = ''
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';
    cursorTheme = { name = "Catppuccin-Latte-Dark"; };
  };
}
