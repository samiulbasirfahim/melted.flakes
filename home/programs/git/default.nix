{ user, ... }: {
  programs = {
    gh.enable = true;
    git = {
      enable = true;
      userName = "${user}";
      userEmail = "{user}@gmail.com";
      extraConfig = {
        alias = {
          fuckme = "reset --hard HEAD";
          fuckyou = "push --force";
          please = "push --force-with-lease";
        };
        color.ui = "auto";
        init.defaultBranch = "main";
      };
    };
  };
}
