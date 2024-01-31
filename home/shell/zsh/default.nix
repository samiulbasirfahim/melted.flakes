{
  programs.zsh = {
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
      record =
        "ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0+0,0 $HOME/vids/$(date +'%Y%m%d%H%M%S_1.mp4')";
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
  };
}
