{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nixvim.homeManagerModules.nixvim];
  programs.neovim = {
    defaultEditor = true;
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.nixvim = {
    enable = true;
    # extraPlugins = [pkgs.vimPlugins.catppuccin-nvim];
    # colorscheme = "catppuccin-mocha";
    colorschemes.catppuccin = {
      enable = true;
      # transparentBackground = true;
      background = {
        dark = "mocha";
        light = "mocha";
      };
    };

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    globals.mapleader = " ";
    maps = {
      normalVisualOp.";" = ":";
      normal."<leader>n" = {
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