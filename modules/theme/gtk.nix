{ pkgs, ... }:
let colors = import ./ui.nix { };
in {
  home-manager.users.xenoxanite = with colors; {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      maple-mono
      font-awesome
      adw-gtk3
      gradience
    ];
    gtk = {
      enable = true;
      theme = {
        name = "Dark-decay";
        package = pkgs.dark-decay;
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
