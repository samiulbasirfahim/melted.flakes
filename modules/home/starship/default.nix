{pkgs, ...}: {
  programs.starship = let
    flavour = "mocha";
  in {
    enable = true;
    enableZshIntegration = true;
    settings =
      {
        character = {
          success_symbol = "[](green)";
          error_symbol = "[✗](red)";
        };
        directory = {
          truncation_length = 4;
          style = "bold blue";
        };
        git_status = {
          deleted = "✗";
          modified = "✶";
          staged = "✓";
          stashed = "≡";
        };
        git_branch = {
          format = " [$symbol$branch]($style) ";
          symbol = " ";
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
