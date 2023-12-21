{
  imports = [ ./waybar ./hyprland ];
  home-manager.users.fahim = {
    imports = [ ./foot ./mako ./rofi ./wlogout ./swaylock ];
  };
}
