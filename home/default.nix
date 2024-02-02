{ inputs, self, user, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.${user} = {
      imports = [
        ./dev/editor/neovim
        ./dev/languages
        ./packages
        ./ui/gtk
        ./ui/pywal
        ./shell/zsh
        ./shell/starship
        ./scripts
        ./programs/firefox
        ./programs/mako
        ./programs/launcher
        ./programs/tmux
        ./programs/btop
        ./programs/git
        ./wm/hyprland
        ./terminals
      ];
      firefox.enable = true;
      pywal.enable = true;
      tmux.enable = true;
      home = {
        username = "${user}";
        homeDirectory = "/home/${user}";
        stateVersion = "23.11";
        sessionPath = [ "$HOME/bin" "$HOME/.local/bin" "$HOME/.cargo/bin" ];
      };
      programs.home-manager.enable = true;
    };
  };
}
