{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  environment.variables.EDITOR = "nvim";
  home-manager.users.xenoxanite = { pkgs, ... }: {

    programs.neovim.enable = true;
    programs.neovim.defaultEditor = true;

    home = {
      packages = with pkgs; [
        # utilities
        ripgrep
        fd
        neovide

        # language server
        rust-analyzer
        clang-tools
        nil
        lua-language-server

        # formatter
        stylua
        rustfmt
        nixfmt

        # lints
        statix
        eslint_d
      ];
      sessionVariables = { EDITOR = "nvim"; };
    };
  };
}
