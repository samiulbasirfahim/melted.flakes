{ inputs, self, user, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs user; };
    users.${user} = {
      imports = [
        ./dev/editor/neovim
        ./dev/editor/codium
        ./dev/languages
        ./packages
        ./xdg/dir.nix
        ./ui/gtk
        ./ui/pywal
        ./shell/zsh
        ./shell/starship
        ./scripts
        ./programs/firefox
        ./programs/foot
        ./programs/dunst
        ./programs/launcher
        ./programs/cava
        ./programs/tmux
        ./programs/btop
        ./programs/git
        ./programs/discord
        ./programs/spotify
        ./hyprland
      ] ++ [ inputs.spicetify-nix.homeManagerModule ];
      firefox.enable = true;
      hyprland.enable = true;
      spotify.enable = true;
      programs.discord = {
        enable = true;
        wrapDiscord = true;
      };
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
