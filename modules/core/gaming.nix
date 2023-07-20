{pkgs, ...}: let
  hyprctl = "${pkgs.hyprland}/bin/hyprctl";
in {
  programs.steam = {
    enable = true;
  };
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        amd_performance_level = "high";
      };
      custom = {
        start = ''${hyprctl} --batch "keyword decoration:active_opacity 1; keyword decoration:inactive_opacity 1; keyword decoration:blur 0; keyword decoration:drop_shadow 0; keyword animations:enabled false" && ${pkgs.libnotify}/bin/notify-send "GameMode started"';
        end = ''${hyprctl} --batch "keyword decoration:active_opacity 0.97; keyword decoration:inactive_opacity 0.95; keyword decoration:blur 1; keyword decoration:drop_shadow 0; keyword animations:enabled true" && ${pkgs.libnotify}/bin/notify-send "GameMode ended"'';
      };
    };
  };
}
