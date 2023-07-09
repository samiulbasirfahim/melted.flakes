{pkgs, ...}: {
  programs.starship = let
    flavour = "mocha";
  in {
    enable = true;
    enableZshIntegration = true;
    settings =
      {
        character = {
          success_symbol = "[](bold green)";
          error_symbol = "[✗](bold red) ";
        };
        git_branch = {
          format = " [$symbol$branch]($style) ";
          symbol = "";
          style = "bold yellow";
        };
        palette = "catppuccin_${flavour}";
      }
      // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "3e3e54410c3189053f4da7a7043261361a1ed1bc";
            sha256 = "soEBVlq3ULeiZFAdQYMRFuswIIhI9bclIU8WXjxd7oY=";
          }
          + /palettes/${flavour}.toml));
  };
}
