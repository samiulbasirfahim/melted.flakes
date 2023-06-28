{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
  gtk = {
    enable = true;
    theme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    font.name = "JetbrainsMono nerd font";
    font.size = 11;
    cursorTheme = {
      name = "Catppuccin-Latte-Dark";
    };
  };
  home.pointerCursor = {
    package = pkgs.cattpuccin-dark-cursor;
    name = "Catppuccin-Latte-Dark";
    size = 15;
  };
}
