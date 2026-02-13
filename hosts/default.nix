{
  inputs,
  ...
}:
let
  inherit (inputs.nixpkgs.lib) nixosSystem genAttrs;
  username = "pablo";

  mkNixosConfigurations =
    hosts:
    genAttrs hosts (
      hostname:
      nixosSystem {
        specialArgs = { inherit inputs hostname username; };
        modules = [
          ./${hostname}

          # Common modules
          ../nixosModules
        ];
      }
    );
in
{
  flake.nixosConfigurations = mkNixosConfigurations [
    # "doraemon"
    "mbp"
    "pixel"
  ];
}
