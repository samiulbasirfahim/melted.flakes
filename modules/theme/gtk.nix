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
      dark-decay
      (catppuccin-gtk.override {
        size = "compact";
        accents = [ "green" ];
        variant = "mocha";
        tweaks = [ "normal" ];
      })

    ];
    gtk = {
      enable = true;
      theme.name = colors.gtk-theme;

      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      font = {
        name = colors.font;
        size = 11;
      };
      cursorTheme = { name = "Catppuccin-Latte-Dark"; };
    };
    /* qt = {
         theme = {
           name = "Catppuccin-Mocha-Dark";
           package = pkgs.catppuccin-kde.override {
             flavour = [ "mocha" ];
             accents = [ "blue" ];
             winDecStyles = [ "modern" ];
           };
         };
       };
    */
    home.pointerCursor = {
      package = pkgs.cattpuccin-dark-cursor;
      name = "Catppuccin-Latte-Dark";
      size = 15;
    };
    home.sessionVariables = {
      GTK_USE_PORTAL = 0;
      GTK_THEME = colors.gtk-theme;
    };
  };
}
