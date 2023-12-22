{ }:
let
  decay = {
    background = "101419";
    contrast = "0e1217";
    statusline_bg = "13171c";
    lighter = "1a1e23";
    foreground = "b6beca";
    cursorline = "242931";
    comments = "485263";
    cursor = "b6beca";
    black = "242931";
    red = "e05f65";
    orange = "E89777";
    yellow = "f1cf8a";
    pink = "f6c9d4";
    green = "78dba9";
    blue = "70a5eb";
    teal = "73C0C9";
    magenta = "c68aee";
    cyan = "74bee9";
    sky = "91c7e7";
    white = "b6beca";
    brightblack = "485263";
    brightred = "e5646a";
    brightgreen = "94f7c5";
    brightyellow = "f6d48f";
    brightblue = "75aaf0";
    brightmagenta = "cb8ff3";
    brightcyan = "79c3ee";
    brightwhite = "e3e6eb";
    lavender = "a9acdb";
    accent = "78dba9";
    gtk-theme = "Dark-decay";

  };
  catppuccin = {
    background = "1E1E2E";
    contrast = "181825";
    statusline_bg = "11111b";
    lighter = "1a1e23";
    foreground = "CDD6F4";
    cursorline = "242931";
    comments = "4d5768";
    cursor = "F5E0DC";
    black = "45475A";
    red = "F38BA8";
    orange = "E89777";
    yellow = "F9E2AF";
    pink = "f5c2e7";
    green = "A6E3A1";
    blue = "89B4FA";
    teal = "94e2d5";
    magenta = "F5C2E7";
    sky = "89dceb";
    cyan = "94E2D5";
    white = "BAC2DE";
    brightblack = "585B70";
    brightred = "F38BA8";
    brightgreen = "A6E3A1";
    brightyellow = "F9E2AF";
    brightblue = "89B4FA";
    brightmagenta = "cb8ff3";
    brightcyan = "F5C2E7";
    brightwhite = "A6ADC8";
    lavender = "a9acdb";
    accent = "78dba9";
    gtk-theme = "Catppuccin-Mocha-Compact-Green-Dark";
  };
in rec {
  colors = catppuccin;
  font = "JetBrains Mono";
  nerd-font = "JetBrainsMono Nerd Font";
  foreground-color = colors.teal;
  border-size = 2;
  border-radius = 0;
  border-color = colors.green;
}
