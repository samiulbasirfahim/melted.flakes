{pkgs, ...}: {
  home.packages = with pkgs; [webcord];
  xdg.configFile."WebCord/Themes/mocha".text = ''
    * {
        font-family: JetbrainsMono Nerd font;
    }
    @import url(" https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css ");
  '';
}
