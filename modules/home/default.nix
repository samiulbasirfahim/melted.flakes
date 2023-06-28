{...}: {
  imports =
    [(import ./git)]
    ++ [(import ./codium)]
    ++ [(import ./waybar)]
    ++ [(import ./wofi)]
    ++ [(import ./wlogout)]
    ++ [(import ./gtk)]
    ++ [(import ./starship)]
    ++ [(import ./zsh)]
    ++ [(import ./hyprland)];
}
