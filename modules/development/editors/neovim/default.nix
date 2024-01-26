{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  environment.variables.EDITOR = "nvim";
  home-manager.users.xenoxanite = { pkgs, ... }: {
    programs = {
      neovim = {
        enable = true;
        defaultEditor = true;
        extraPackages = with pkgs; [
          # utilities
          ripgrep
          fd

          # language server
          rust-analyzer
          clang-tools
          nil
          lua-language-server
          nodePackages_latest.svelte-language-server
          typescript
          tailwindcss-language-server

          # formatter
          stylua
          rustfmt
          nixfmt

          # lints
          statix
          eslint_d
        ];
      };
    };

    home = {

      sessionVariables = { EDITOR = "nvim"; };
    };
  };
}
