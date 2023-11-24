{ pkgs, ... }:
let colors = import ./../../theme/colors.nix { };
in with colors; {
  home.packages = [ pkgs.libnotify ];
  services.mako = {
    enable = true;
    font = "${font} 10";
    anchor = "top-right";
    textColor = "#${blue}";
    backgroundColor = "#${background}";
    borderColor = "#${green}";
    borderRadius = 0;
    borderSize = 2;
    defaultTimeout = 5000;
    height = 100;
    width = 300;
    padding = "20";
    icons = true;
    maxVisible = 6;
    sort = "-time";
    markup = true;
    layer = "overlay";
    actions = true;

    extraConfig = ''
      max-history=100
      max-icon-size=48
      icon-location=left
      history=1

      [urgency=high]
      border-color=#${red}
    '';
  };
}
