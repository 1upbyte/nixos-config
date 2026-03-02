{
  config,
  pkgs,
  ...
}:
{
  config = {
    environment.systemPackages = [ pkgs.librepods ];
  };
}
