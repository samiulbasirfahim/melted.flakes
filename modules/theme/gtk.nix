{ pkgs, ... }:
let ui = import ./ui.nix { };
in {
  home-manager.users.fahim = {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      (catppuccin-gtk.override {
        size = "compact";
        accents = [ "green" ];
        variant = "mocha";
        tweaks = [ "normal" ];
      })

    ];
    gtk = {
      enable = true;
      theme.name = ui.colors.gtk-theme;
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      font = {
        name = ui.nerd-font;
        size = 11;
      };
      cursorTheme = { name = "Catppuccin-Latte-Dark"; };
    };
    home.pointerCursor = {
      package = pkgs.cattpuccin-dark-cursor;
      name = "Catppuccin-Latte-Dark";
      size = 15;
    };
    home.sessionVariables = {
      GTK_USE_PORTAL = 0;
      GTK_THEME = ui.colors.gtk-theme;
    };
  };
}
