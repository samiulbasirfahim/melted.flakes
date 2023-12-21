{inputs, ...}: {
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    users.fahim = {
      imports = [(import ./../home)];
      home = {
        username = "fahim";
        homeDirectory = "/home/fahim";
        stateVersion = "22.11";
      };
      programs.home-manager.enable = true;
    };
  };
}
