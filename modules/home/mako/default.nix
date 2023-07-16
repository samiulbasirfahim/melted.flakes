{pkgs, ...}: {
  home.packages = [pkgs.libnotify];
  services = {
    mako = {
      enable = true;
      font = "JetbrainsMono nerd font 12";
      padding = "20";
      defaultTimeout = 5000;
      borderSize = 1;
      # borderRadius = 2;
      borderRadius = 0;
      backgroundColor = "#1e1e2e";
      borderColor = "#964B61";
      progressColor = "over #313244";
      textColor = "#cdd6f4";
      extraConfig = ''
        text-alignment=center
        [urgency=high]
        border-color=#E1BFBF
      '';
    };
  };
}
