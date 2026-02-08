{
  pkgs,
  config,
  ...
}: {
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
    authKeyFile = "${config.age.secrets.tailscale.path}";
    extraUpFlags = ["--ssh"];
    openFirewall = true;
  };

}
