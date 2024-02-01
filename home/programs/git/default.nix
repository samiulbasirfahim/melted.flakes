{
  programs = {
    gh.enable = true;
    git = {
      enable = true;
      userName = "Xenoxanite";
      userEmail = "xenoxanite@gmail.com";
      extraConfig = {
        url = {
          "ssh://git@github.com:xenoxanite" = {
            insteadOf = "https://github.com/xenoxanite/";
          };
        };
      };
    };
  };
}
