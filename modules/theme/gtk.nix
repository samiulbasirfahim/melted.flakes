{ pkgs, ... }:
let ui = import ./ui.nix { };
in {
  home-manager.users.xenoxanite = {
    fonts.fontconfig.enable = true;
    home = {
      packages = with pkgs; [
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        (catppuccin-gtk.override {
          size = "compact";
          accents = [ "green" ];
          variant = "mocha";
          tweaks = [ "normal" ];
        })
      ];
      pointerCursor = {
        package = pkgs.cattpuccin-dark-cursor;
        name = "Catppuccin-Latte-Dark";
        size = 12;
      };
      sessionVariables = {
        GTK_USE_PORTAL = 0;
        GTK_THEME = ui.colors.gtk-theme;
      };
    };
    gtk = {
      enable = true;
      theme.name = ui.colors.gtk-theme;
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      font = {
        name = ui.nerd-font;
        size = 10;
      };
      cursorTheme = { name = "Catppuccin-Latte-Dark"; };
    };
  };
}
