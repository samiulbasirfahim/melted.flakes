{
  pkgs,
  lib,
  ...
}: {
  home-manager.users.xenoxanite = let
    package = pkgs.bat;
  in {
    programs.bat = {
      enable = true;
      themes = {
        Catppuccin-mocha = builtins.readFile (pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
            sha256 = "6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
          }
          + "/Catppuccin-mocha.tmTheme");
      };
    };

    # home.activation.batCache = lib.hm.dag.entryAfter ["linkGeneration"] ''
    #   $VERBOSE_ECHO "Rebuilding bat theme cache"
    #   $DRY_RUN_CMD ${lib.getExe package} cache --build
    # '';
    home.sessionVariables = {
      BAT_THEME = "Catppuccin-mocha";
    };
  };
}
