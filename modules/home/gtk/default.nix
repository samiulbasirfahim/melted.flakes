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
  };
}
