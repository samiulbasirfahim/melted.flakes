{ pkgs, ... }:
let colors = import ./colors.nix { };
in {
  home-manager.users.xenoxanite = with colors; {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
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
      font.name = "${font}";
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
