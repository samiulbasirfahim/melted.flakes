{
  imports = [ ./waybar ./hyprland ];
  home-manager.users.xenoxanite = {
    imports = [ ./foot ./mako ./rofi ./wlogout ./swaylock ];
  };
}
