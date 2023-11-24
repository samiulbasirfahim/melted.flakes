{ pkgs, ... }: {
  home-manager.users.xenoxanite = {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      prefix = "C-a";
      terminal = "screen-256color";
      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        {
          plugin = catppuccin;
          extraConfig = ''
            set -g @catppuccin_flavour 'mocha' # or frappe, macchiato, mocha
            set -g @catppuccin_status_modules_right "application user"
            set -g @catppuccin_status_left_separator "█"
            set -g @catppuccin_status_right_separator "█"
          '';
        }
      ];
      extraConfig = ''
        # better split
        bind '"' split-window -h -c "#{pane_current_path}"
        bind % split-window -v -c "#{pane_current_path}"

        # reload
        unbind r
        bind r source-file ~/.config/tmux/tmux.conf
        unbind /

        # Swap kill with display pane binds
        bind q kill-pane
        bind x display-pane
      '';
    };
  };
}
