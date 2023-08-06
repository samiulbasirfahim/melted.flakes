{
  imports = [
    ./discord
    ./firefox
    ./gtk
    ./packages
    ./pywal
    ./rofi
    ./scripts
    ./spotify
    ./starship
  ];

   home.sessionPath = [ 
    "$HOME/.yarn/bin"
    "$HOME/.local/bin"
 ];
}
