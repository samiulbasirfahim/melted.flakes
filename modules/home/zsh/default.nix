{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
    };
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /home/xenoxanite/Flakes/.#nixos";
      ncg = "nix-collect-garbage && nix-collect-garbage -d && sudo nix-collect-garbage && nix-collect-garbage -d &&  sudo rm /nix/var/nix/gcroots/auto/*";
    };
  };
}
