
{
  pkgs,
  config,
  ...
}: {
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
    authKeyFile = "${config.age.secrets.tailscale-pixel.path}";
    extraUpFlags = ["--login-server=https://headscale.pablo.ac" "--ssh"];
  };

  environment.systemPackages = [ pkgs.tailscale ];
}
