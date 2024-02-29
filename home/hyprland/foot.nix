{
  xdg.configFile."wal/templates/foot".text = ''
    [colors]
    foreground	= {foreground.strip}
    background	= {background.strip}
    alpha		=  0.95

    regular0	= {color0.strip}
    regular1	= {color1.strip}
    regular2	= {color2.strip}
    regular3	= {color3.strip}
    regular4	= {color4.strip}
    regular5	= {color5.strip}
    regular6	= {color6.strip}
    regular7	= {color7.strip}
    bright0		= {color8.strip}
    bright1		= {color9.strip}
    bright2		= {color10.strip}
    bright3		= {color11.strip}
    bright4		= {color12.strip}
    bright5		= {color13.strip}
    bright6		= {color14.strip}
    bright7		= {color15.strip}

    [cursor]
    color={color0.strip} {color7.strip}
  '';
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "JetbrainsMono Nerd Font:size=16";
        pad = "3x3";
        include = "~/.cache/wal/foot";
      };
      cursor = {
        style = "block";
        blink = "yes";
      };
    };
  };
}