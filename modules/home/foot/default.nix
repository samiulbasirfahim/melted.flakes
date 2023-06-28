{pkgs, ...}: {
  programs.foot = {
    enable = true;
    server.enable = false;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12:line-height=10px";
        pad = "12x12";
      };
      colors = {
        foreground = "D8DEE9";
        background = "2E3440";
        regular0 = "3B4252"; # black
        regular1 = "BF616A";
        regular2 = "A3BE8C";
        regular3 = "EBCB8B";
        regular4 = "81A1C1";
        regular5 = "B48EAD";
        regular6 = "88C0D0";
        regular7 = "E5E9F0";
        bright0 = "4C566A"; # bright black
        bright1 = "BF616A"; # bright red
        bright2 = "A3BE8C"; # bright green
        bright3 = "EBCB8B"; # bright yellow
        bright4 = "81A1C1";
        bright5 = "B48EAD"; # bright magenta
        bright6 = "88C0D0"; # bright cyan
        bright7 = "E5E9F0"; # bright white
      };
    };
  };
}
