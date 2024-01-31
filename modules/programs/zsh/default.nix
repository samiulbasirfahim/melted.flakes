{ pkgs, config, ... }: {
  environment.shells = with pkgs; [ zsh ];
  environment.pathsToLink = [ "/share/zsh" ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    loginShellInit = ''
      if [[ "$(tty)" == "/dev/tty1" ]] then
        ${
          if config.services.xserver.displayManager.startx.enable then
            "startx"
          else
            (if config.programs.hyprland.enable then "Hyprland" else "")
        }
      fi
    '';
  };
  home-manager.users.xenoxanite.programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = true;
    shellAliases = {
      ls = "exa --icons";
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      lt = "ls --tree";
      lta = "ls --tree -a";
      rebuild = "sudo nixos-rebuild switch --flake /home/xenoxanite/dev/flakes";
      update = "nix flake update /home/xenoxanite/dev/flakes";
      ncg =
        "nix-collect-garbage -d && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
      v =
        "fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim";
      record = if config.services.xserver.displayManager.startx.enable then
        "ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0+0,0 $HOME/vids/$(date +'%Y%m%d%H%M%S_1.mp4')"
      else
        (if config.programs.hyprland.enable then
          "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/vids/$(date +'%Y%m%d%H%M%S_1.mp4')"
        else
          "");
    };
    dirHashes = {
      docs = "$HOME/docs";
      notes = "$HOME/docs/notes";
      dots = "$HOME/dev/flakes";
      dl = "$HOME/downloads";
      vids = "$HOME/vids";
      pix = "$HOME/pix";
      media = "/run/media/$USER";
    };
    plugins = [{
      name = "zsh-nix-shell";
      file = "nix-shell.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "chisui";
        repo = "zsh-nix-shell";
        rev = "v0.8.0";
        sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
      };
    }];
  };
}
