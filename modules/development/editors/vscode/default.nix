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
          colorTheme = "Dark Decay";
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
            name = "decay";
            version = "1.0.9";
            publisher = "decaycs";
            sha256 = "TwDq8K757CTFEBBBGbP5eOC5nMrQzgf/XYIHi9UCAkU=";
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
