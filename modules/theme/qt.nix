{
  home-manager.users.xenoxanite = { pkgs, ... }: {
    xdg = {
      configFile = {
        "kdeglobals".source = "${
            (pkgs.catppuccin-kde.override {
              flavour = [ "mocha" ];
              accents = [ "blue" ];
              winDecStyles = [ "modern" ];
            })
          }/share/color-schemes/CatppuccinMochaBlue.colors";
        "Kvantum/catppuccin/catppuccin.kvconfig".source = builtins.fetchurl {
          url =
            "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.kvconfig";
          sha256 = "1f8xicnc5696g0a7wak749hf85ynfq16jyf4jjg4dad56y4csm6s";
        };

        "Kvantum/catppuccin/catppuccin.svg".source = builtins.fetchurl {
          url =
            "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.svg";
          sha256 = "0vys09k1jj8hv4ra4qvnrhwxhn48c2gxbxmagb3dyg7kywh49wvg";
        };

        "Kvantum/kvantum.kvconfig".text = ''
          [General]
          theme=catppuccin

          [Applications]
          catppuccin=qt5ct, org.kde.dolphin, org.kde.kalendar, org.qbittorrent.qBittorrent, hyprland-share-picker, dolphin-emu, Nextcloud, nextcloud
        '';
      };
    };
    qt = {
      enable = true;
      # platformTheme = "gtk"; # just an override for QT_QPA_PLATFORMTHEME, takes "gtk" or "gnome"
      style = {
        package = pkgs.catppuccin-kde;
        name = "Catpuccin-Mocha-Dark";
      };
    };
  };
}
