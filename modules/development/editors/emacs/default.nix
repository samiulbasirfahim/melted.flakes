{ inputs, ... }: {
  home-manager.users.fahim = {
    imports = [ inputs.nix-doom-emacs.hmModule ];
    programs.doom-emacs = {
      enable = true;
      doomPrivateDir = /home/fahim/.config/doom;
    };
  };
}
