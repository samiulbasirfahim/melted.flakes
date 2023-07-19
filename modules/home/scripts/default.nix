{...}: {
  imports = [(import ./wallpaper-picker.nix)] ++ [(import ./random-wall.nix)] ++ [(import ./reload.nix)] + [(import ./reload-discord.nix)];
}
