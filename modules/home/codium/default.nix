{
  pkgs,
  inputs,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "editor.cursorBlinking" = "expand";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.cursorStyle" = "underline";
      "editor.fontFamily" = "JetbrainsMono nerd font";
      "editor.fontSize" = 16;
      "editor.lineHeight" = 2.3;
      "editor.minimap.enabled" = false;
      "editor.mouseWheelZoom" = false;
      "tabnine.experimentalAutoImports" = true;
      "terminal.integrated.fontFamily" = "JetbrainsMono nerd font";
      "terminal.integrated.fontSize" = 16;
      "window.menuBarVisibility" = "hidden";
      "window.zoomLevel" = 0.3;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.productIconTheme" = "material-product-icons";
      "workbench.sideBar.location" = "left";
      "workbench.startupEditor" = "none";
      "workbench.statusBar.visible" = false;
    };
    keybindings = [
      {
        "key" = "ctrl+shift+i";
        "command" = "editor.action.formatDocument";
        "when" = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
      }
    ];
    extensions = with pkgs.vscode-extensions; [
      kamadorueda.alejandra
      catppuccin.catppuccin-vsc
      bbenoist.nix
      pkief.material-product-icons
      catppuccin.catppuccin-vsc-icons
      tabnine.tabnine-vscode
      ms-python.python
    ];
    #++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [];
  };
  programs.zsh.shellAliases = {
    code = "codium -ozone-platform-hint";
  };
  home.packages = with pkgs; [
    inputs.alejandra.defaultPackage.${system}
  ];
}
