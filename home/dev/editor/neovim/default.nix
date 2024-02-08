{ pkgs, ... }: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        ripgrep
        fd

        # language server
        clang-tools
        nil
        lua-language-server

        # formatter
        stylua
        rustfmt
        nixfmt
        prettierd

        # lints
        statix
        eslint_d
      ];
    };
  };

  home = { sessionVariables = { EDITOR = "nvim"; }; };
}
