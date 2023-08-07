{
  imports = [
    ./discord
    ./firefox
    ./gtk
    ./packages
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
