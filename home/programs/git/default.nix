{ user, ... }: {
  programs = {
    gh.enable = true;
    git = {
      enable = true;
      userName = "${user}";
      userEmail = "{user}@gmail.com";
      extraConfig = {
        url = {
          "ssh://git@github.com:${user}" = {
            insteadOf = "https://github.com/${user}/";
          };
        };
      };
    };
  };
}
