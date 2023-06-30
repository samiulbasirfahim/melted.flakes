{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.libnotify];
  services = {
    mako = {
      enable = true;
      font = "JetBrainsMono Nerd Font 11";
      padding = "20";
      defaultTimeout = 5000;
      borderSize = 2;
      borderRadius = 2;
      backgroundColor = "#2D333E";
      borderColor = "#242932";
      progressColor = "over #313244";
      textColor = "#cdd6f4";
      extraConfig = ''
        text-alignment=center
        [urgency=high]
        border-color=#B45C65
      '';
    };
  };
}
