{...}: 
{
   imports = [(import ./../../hosts/nixos/configuration.nix)] ++ [(./home-manager.nix)];
}
