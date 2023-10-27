{
  home-manager.users.xenoxanite = {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "JetbrainsMono nerd font:size=18.5:line-height=12";
          dpi-aware = "no";
          resize-delay-ms = 0;
          pad = "10x10";
          include = "~/.cache/wal/colors-foot.ini";
        };
        cursor = {
          style = "beam";
          beam-thickness = "2px";
        };
      };
    };
    xdg.configFile."wal/templates/colors-foot.ini".text = ''
      [colors]
      foreground={foreground.strip}    # Text
      background={background.strip}    # Base
      regular0={color0.strip}   # Surface 1
      regular1={color1.strip}   # Surface# red
      regular2={color2.strip}   # green
      regular3={color3.strip}   # yellow
      regular4={color4.strip}   # blue
      regular5={color5.strip}   # pink
      regular6={color6.strip}   # teal
      regular7={color7.strip}   # Subtext 1
      bright0={color8.strip}   # Surface 2
      bright1={color9.strip}    # red
      bright2={color10.strip}   # green
      bright3={color11.strip}   # yellow
      bright4={color12.strip}   # blue
      bright5={color13.strip}   # pink
      bright6={color14.strip}   # teal
      bright7={color15.strip}   # Subtext 0
    '';
  };
}
