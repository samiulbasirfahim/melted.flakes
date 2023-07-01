{
  inputs,
  pkgs,
  ...
}: {
  imports =
    [inputs.nixvim.homeManagerModules.nixvim]
    ++ [(import ./telescope.nix)]
    ++ [(import ./lsp.nix)]
    ++ [(import ./colorscheme.nix)];
  programs.neovim = {
    defaultEditor = true;
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    ripgrep
  ];

  programs.nixvim = {
    enable = true;
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    globals.mapleader = " ";
    maps.normalVisualOp.";" = ":";
    maps.normal = {
      "<leader>n" = {
        silent = true;
        action = "<cmd>NvimTreeToggle<CR>";
      };
    };
    plugins = {
      nvim-tree = {
        enable = true;
      };
    };
  };
}
