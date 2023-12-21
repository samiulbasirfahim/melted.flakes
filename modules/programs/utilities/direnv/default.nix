{
  home-manager.users.fahim = {
    programs = {
      direnv = {
        enable = true;
        enableZshIntegration = true; # see note on other shells below
        nix-direnv.enable = true;
      };
    };
    home.sessionVariables.DIRENV_LOG_FORMAT = "";
  };
}
