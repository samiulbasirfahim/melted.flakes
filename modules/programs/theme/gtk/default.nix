{ pkgs, ... }: {
  imports = [ ./theme.nix ];

  home-manager.users.xenoxanite = {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; })
      maple-mono
      font-awesome
    ];
    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Mocha-BL-LB";
        package = pkgs.cattpuccin-mocha-gtk;
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      font.name = "Iosevka nerd font";
      font.size = 11;
      cursorTheme = { name = "Catppuccin-Latte-Dark"; };
    };
    home.pointerCursor = {
      package = pkgs.cattpuccin-dark-cursor;
      name = "Catppuccin-Latte-Dark";
      size = 15;
    };
    home.sessionVariables = {
      GTK_USE_PORTAL = 1;
      GTK_THEME = "Catppuccin-Mocha-BL-LB";
    };
  };
}
