{pkgs, ...}: {
  imports = [(import ./settings.nix)] ++ [(import ./style.nix)];

  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
  };
  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];
  });
}
