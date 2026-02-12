{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [
    inputs.helium.packages.${pkgs.system}.default
  ];
}
