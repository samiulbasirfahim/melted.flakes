{pkgs, ...}: {
  imports = [(import ./theme.nix)];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "alacritty";
    extraConfig = {
      show-icons = true;
      icon-theme = "Adwaita";
      terminal = "alacritty";
      drun-display-format = "{name}";
      disable-history = false;
      hide-scrollbar = false;
      window-format = " [{w}]\t\t{t:0}";
      sidebar-mode = true;
      display-run = " ";
      display-drun = " ";
      show-match = true;
      kb-mode-previous = "Alt+h";
      kb-row-left = "Control+Alt+h";
      kb-row-right = "Control+Alt+l";
      kb-row-down = "Control+Alt+j,Control+n,Down";
      kb-row-up = "Control+Alt+k,Control+p,Up";
      kb-remove-word-back = "Control+BackSpace";
      modi = "run,drun";
      me-select-entry = "MousePrimary";
      me-accept-entry = "!MousePrimary";
    };
    # ''
    #   configuration {
    #       show-icons: true;
    #       icon-theme: "Adwaita";
    #       terminal: "alacritty";
    #       drun-display-format:        "{name}";
    #       disable-history: false;
    #       hide-scrollbar: false;
    #       window-format: " [{w}]\t\t{t:0}";
    #       sidebar-mode: true;
    #       display-run: " ";
    #       display-drun: " ";
    #       show-match: true;
    #       kb-mode-previous: "Alt+h";
    #       kb-row-left: "Control+Alt+h";
    #       kb-row-right: "Control+Alt+l";
    #       kb-row-down: "Control+Alt+j,Control+n,Down";
    #       kb-row-up: "Control+Alt+k,Control+p,Up";
    #       kb-remove-word-back: "Control+BackSpace";
    #       modi: "run,drun";
    #       me-select-entry: "MousePrimary";
    #       me-accept-entry: "!MousePrimary";
    #   }

    #   @theme "~/.config/rofi/theme.rasi"
    # '';
  };
}
