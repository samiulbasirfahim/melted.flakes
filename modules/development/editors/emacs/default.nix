{ inputs, ... }: {
  home-manager.users.xenoxanite = {
    imports = [ inputs.nix-doom-emacs.hmModule ];
    programs.doom-emacs = {
      enable = true;
      doomPrivateDir = /home/xenoxanite/.config/doom;
    };
  };
}
