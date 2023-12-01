let colors = import ./../../theme/ui.nix { };
in {
  programs.foot = {
    enable = true;
    settings = with colors; {
      main = {
        font = "${font}:size=14";
        dpi-aware = "no";
        resize-delay-ms = 0;
        pad = "15x2";
      };
      cursor = {
        style = "beam";
        beam-thickness = "2px";
        color = "${background} ${green}";
      };
      colors = {
        foreground = foreground;
        background = background;
        regular0 = black;
        regular1 = red;
        regular2 = green;
        regular3 = yellow;
        regular4 = blue;
        regular5 = magenta;
        regular6 = cyan;
        regular7 = white;
        bright0 = brightblack;
        bright1 = brightred;
        bright2 = brightgreen;
        bright3 = brightyellow;
        bright4 = brightblue;
        bright5 = brightmagenta;
        bright6 = brightcyan;
        bright7 = brightwhite;
      };
    };

  };
}
