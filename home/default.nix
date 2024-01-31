{ inputs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.xenoxanite = {
      imports = [ ./neovim ./packages ./gtk ];
      home = {
        username = "xenoxanite";
        homeDirectory = "/home/xenoxanite";
        stateVersion = "23.11";
      };
      programs.home-manager.enable = true;
    };
  };
}
