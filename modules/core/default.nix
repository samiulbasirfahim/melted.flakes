{ inputs, nixpkgs, self, ... }: {
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    system = "x86_64-linux";
    modules = [
      ./../../hosts/nixos/hardware-configuration.nix
      ./bootloader.nix
      ./hardware.nix
      ./home-manager.nix
      ./network.nix
      ./pipewire.nix
      ./programs.nix
      ./security.nix
      ./services.nix
      ./system.nix
      ./user.nix
      # ./warp.nix
      ./ibus.nix
      ./hosts.nix

      # editors
      ./../development/editors/neovim
      ./../development/editors/emacs
      ./../development/editors/vscode

      # wayland
      # ./../wayland

      ./../x11

      # lnguages
      ./../development/language/cpp.nix
      ./../development/language/rust.nix
      ./../development/language/python.nix
      ./../development/language/javascript.nix

      # utility based programs
      ./../programs/utilities/git
      ./../programs/utilities/bat
      ./../programs/utilities/zsh
      ./../programs/utilities/neofetch
      ./../programs/utilities/starship
      ./../programs/utilities/btop
      ./../programs/utilities/tmux
      ./../programs/utilities/direnv
      # ./../programs/utilities/gaming

      # theme based programs
      ./../theme/gtk.nix
      ./../theme/pywal.nix
    ];
  };
}
