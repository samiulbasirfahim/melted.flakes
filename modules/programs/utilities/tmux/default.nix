{ pkgs, ... }:
let ui = import ./../../../theme/ui.nix { };
in {
  home-manager.users.xenoxanite = {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      prefix = "C-a";
      terminal = "screen-256color";
      plugins = with pkgs.tmuxPlugins; [ vim-tmux-navigator ];
      extraConfig = with ui.colors; ''
        # better split
        bind '"' split-window -h -c "#{pane_current_path}"
        bind '|' split-window -v -c "#{pane_current_path}"

        # reload
        unbind r
        bind r source-file ~/.config/tmux/tmux.conf
        unbind /

        # Swap kill with display pane binds
        bind q kill-pane
        bind x display-pane

        set -g status-left '''
        set -g status-right '''
        set -g window-status-format ' #I #W '
        set -g window-status-current-format ' #W '

        set -g status-style bg='#${background}',fg='#${blue}'
        setw -g window-status-activity-style bg='#${background}',fg='#${blue}'
        setw -g window-status-current-style  bg='#${green}',fg='#${background}'
        setw -g pane-base-index 1
      '';
    };
  };
}
