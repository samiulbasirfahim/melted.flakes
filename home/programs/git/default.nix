{ user, ... }: {
  programs = {
    gh.enable = true;
    git = {
      enable = true;
      userName = "${user}";
      userEmail = "{user}@gmail.com";
    };
  };
}
