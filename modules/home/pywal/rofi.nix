{
  xdg.configFile."wal/templates/colors-rofi-dark.rasi".text = ''
    * {{
        active-background: {color2};
        active-foreground: @foreground;
        normal-background: @background;
        normal-foreground: @foreground;
        urgent-background: {color1};
        urgent-foreground: @foreground;

        alternate-active-background: @background;
        alternate-active-foreground: @foreground;
        alternate-normal-background: @background;
        alternate-normal-foreground: @foreground;
        alternate-urgent-background: @background;
        alternate-urgent-foreground: @foreground;

        selected-active-background: {color11};
        selected-active-foreground: @foreground;
        selected-normal-background: {color2};
        selected-normal-foreground: @foreground;
        selected-urgent-background: {color3};
        selected-urgent-foreground: @foreground;

        background-color: @background;
        background: {background};
        foreground: {foreground};
        border-color: @background;
        spacing: 2;
    }}
  '';
}
