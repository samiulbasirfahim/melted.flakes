{
  home-manager.users.fahim = { pkgs, ... }: {
    qt.enable = true;
    qt.platformTheme = "qtct";
    qt.style.name = "kvantum";

    home.packages = with pkgs;
      [
        (catppuccin-kvantum.override {
          accent = "Green";
          variant = "Mocha";
        })
      ];

    xdg.configFile."Kvantum/kvantum.kvconfig".source =
      (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
        General.Theme = "Catppuccin-Mocha-Mauve";
      };
  };
}
