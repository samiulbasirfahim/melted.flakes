{ pkgs, ... }: {
  home-manager.users.xenoxanite = {
    programs.vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = {

        editor = {
          fontFamily = "JetBrainsMono Nerd Font";
          fontSize = 14;
          fontLigatures = true;
          minimap.enabled = false;
        };
        terminal.integrated = {
          fontFamily = "JetBrainsMono Nerd Font";
          fontSize = 16;
        };
        window = {
          menuBarVisibility = "toggle";
          zoomLevel = 1;
        };
        workbench = {
          startupEditor = "none";
          colorTheme = "Wal";
          productIconTheme = "el-vsc-v1-icons";
          statusBar.visible = false;
        };
      };
      extensions = with pkgs.vscode-extensions;
        [
          esbenp.prettier-vscode
          bbenoist.nix
          svelte.svelte-vscode
          naumovs.color-highlight
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "wal-theme";
            version = "1.2.0";
            publisher = "dlasagno";
            sha256 = "X16N5ClNVLtWST64ybJUEIRo6WgDCzODhBA9ScAHI5w=";
          }
          {
            name = "el-vsc-product-icon-theme";
            version = "0.1.8";
            publisher = "ElAnandKumar";
            sha256 = "HKPl4Q9aH8MkDNfRDwzge81hzoiM2VpYvuBmfWfmqV4=";
          }
        ];
    };
  };
}
