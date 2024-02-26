
{ pkgs, ... }: {

 programs = {
   neovim = {
     enable = true;
     defaultEditor = true;
     extraPackages = with pkgs; [
       ripgrep
       fd
     ];
   };
 };

 home.packages = with pkgs; [
       # language server
       clang-tools
       nil
       lua-language-server

       # formatter
       stylua
       nixfmt
       prettierd

       # lints
       statix
       eslint_d
];
  home = { sessionVariables = { EDITOR = "nvim"; }; };
}
