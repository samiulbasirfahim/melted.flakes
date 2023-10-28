{
  imports = [
    # ./discord
    ./firefox
    ./packages

    ./scripts
    # ./spotify
  ];
  programs.qutebrowser = {
    enable = true;
  };
}
