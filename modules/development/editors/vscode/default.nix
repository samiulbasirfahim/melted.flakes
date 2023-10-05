{
  pkgs,
  inputs,
  ...
}: {
  home-manager.users.xenoxanite = {
    programs.vscode = {
      enable = true;
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      mutableExtensionsDir = true;
      userSettings = {
        "editor.cursorBlinking" = "expand";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.cursorStyle" = "line";
        "editor.fontFamily" = "JetbrainsMono nerd font";
        "editor.fontSize" = 16;
        "editor.lineHeight" = 2.3;
        "editor.minimap.enabled" = false;
        "editor.formatOnSave" = true;
        "editor.mouseWheelZoom" = false;
        "tabnine.experimentalAutoImports" = true;
        "terminal.integrated.fontFamily" = "JetbrainsMono nerd font";
        "editor.fontLigatures" = true;
        "terminal.integrated.fontSize" = 14;
        "window.menuBarVisibility" = "hidden";
        "window.zoomLevel" = 1.2;
        "workbench.colorTheme" = "Wal";
        "workbench.iconTheme" = "catppuccin-mocha";
        "workbench.productIconTheme" = "Tabler";
        "workbench.sideBar.location" = "left";
        "workbench.startupEditor" = "none";
        "workbench.statusBar.visible" = false;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
      };
      keybindings = [
        {
          "key" = "ctrl+shift+s";
          "command" = "editor.action.formatDocument";
          "when" = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
        }
        {
          "key" = "shift+ctrl+down";
          "command" = "editor.action.insertCursorBelow";
          "when" = "editorTextFocus";
        }
        {
          "key" = "shift+ctrl+up";
          "command" = "editor.action.insertCursorAbove";
          "when" = "editorTextFocus";
        }
        {
          "key" = "shift+alt+down";
          "command" = "editor.action.copyLinesDownAction";
          "when" = "editorTextFocus";
        }
        {
          "key" = "shift+alt+up";
          "command" = "editor.action.copyLinesUpAction";
          "when" = "editorTextFocus";
        }
      ];
      extensions = with pkgs.vscode-extensions;
        [
          kamadorueda.alejandra
          bbenoist.nix
          jnoortheen.nix-ide
          catppuccin.catppuccin-vsc-icons
          tabnine.tabnine-vscode
          formulahendry.code-runner
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            publisher = "dlasagno";
            name = "wal-theme";
            version = "1.1.2";
            sha256 = "vO9FjzA3+5VTgnBY12eawPCfDzKap07Tgf5jqz/IgN0=";
          }
          {
            publisher = "zguolee";
            name = "tabler-icons";
            version = "0.2.2";
            sha256 = "UxMjXwfL9YMb7nGH41LoAu9R3b4dWdK66+w0tfGy8Lk=";
          }
          {
            publisher = "ccls-project";
            name = "ccls";
            version = "0.1.29";
            sha256 = "RjMYBLgbi+lgPqaqN7yh8Q8zr9euvQ+YLEoQaV3RDOA=";
          }
        ];
    };
    home.packages = with pkgs; [
      inputs.alejandra.defaultPackage.${system}
    ];
  };
}
