let colors = import ./../../../theme/colors.nix { };
in {
  xdg.configFile."nvim-colors.lua".text = with colors; ''
    local M = {}

    function M.get_palette()
      return {
          background = "#${background}";
          contrast = "#${background}";
          statusline_bg = "#${statusline_bg}";
          lighter = "#${lighter}";
          foreground = "#${foreground}";
          cursorline = "#${cursorline}";
          comments = "#${comments}";
          cursor = "#${cursor}";
          black = "#${black}";
          red = "#${red}";
          orange = "#${orange}";
          yellow = "#${yellow}";
          pink = "#${pink}";
          green = "#${green}";
          blue = "#${blue}";
          teal = "#${teal}";
          magenta = "#${magenta}";
          cyan = "#${cyan}";
          sky = "#${sky}";
          white = "#${white}";
          brightblack = "#${brightblack}";
          brightred = "#${brightred}";
          brightgreen = "#${brightgreen}";
          brightyellow = "#${brightyellow}";
          brightblue = "#${brightblue}";
          brightmagenta = "#${brightmagenta}";
          brightcyan = "#${brightcyan}";
          brightwhite = "#${brightwhite}";
          lavender = "#${lavender}";
          accent = "#${accent}";
      }
    end
    return M
  '';
}
