{
  description = "My first flake!";

  input = {
      nixpkgs = {
          url = "github:NixOS/nixpkgs/nixos-23.11";
      };
  };

  outputs = {self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      E14nix = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix];
        }
    };
  };
}
