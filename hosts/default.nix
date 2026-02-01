{
  inputs,
  ...
}:
let
  inherit (inputs.nixpkgs.lib) nixosSystem genAttrs;

  mkNixosConfigurations =
    hosts:
    genAttrs hosts (
      hostname:
      nixosSystem {
        specialArgs = { inherit inputs hostname; };
        modules = [
          ./${hostname}

          # Common modules
          ../nixosModules
          inputs.nix-index-database.nixosModules.nix-index
        ];
      }
    );
in
{
  flake.nixosConfigurations = mkNixosConfigurations [
    # "doraemon"
    # "dorami"
    "pixel"
  ];
}
