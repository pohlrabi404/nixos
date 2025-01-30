{
  description = "NixOS Main Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      lib,
      ...
    }:
    {
      nixosConfigurations = {
        main = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./machines/main/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.pohlrabi = import ./users/pohlrabi/default.nix;
            }
          ];
        };

        work = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./machines/work/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.pohlrabi = import ./users/pohlrabi/default.nix;
            }
          ];
        };
      };

    };
}
