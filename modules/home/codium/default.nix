{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "workbench.colorTheme" = "Nord";
      "workbench.iconTheme" = "a-file-icon-vscode";
      "workbench.productIconTheme" = "a-file-icon-vscode-product-icon-theme";
      "editor.fontFamily" = "JetbrainsMono nerd font";
      "editor.fontSize" = 17;
      "editor.lineHeight" = 2;
      "window.menuBarVisibility" = "toggle";
      "window.zoomLevel" = 0.3;
      "workbench.statusBar.visible" = false;
      "editor.minimap.enabled" = false;
      "git.autofetch" = true;
      "terminal.integrated.fontFamily" = "JetbrainsMono nerd font";
      "terminal.integrated.fontSize" = 17;
      "workbench.startupEditor" = "none";
      "editor.mouseWheelZoom" = false;
    };
    keybindings = [
      {
        "key" = "ctrl+shift+i";
        "command" = "editor.action.formatDocument";
        "when" = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
      }
    ];
    extensions = with pkgs.vscode-extensions;
      [
        kamadorueda.alejandra
        arcticicestudio.nord-visual-studio-code
        bbenoist.nix
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "a-file-icon-vscode";
          publisher = "AtomMaterial";
          version = "1.0.0";
          sha256 = "nEmUPCpjiIqjvqWwWNsw44lLbVclRAa4Sa4VR9xkXUc=";
        }
      ];
  };
}
