{
  lib,
  config,
  username,
  ...
}:
{
  users.users.${username}.extraGroups = [ "netbird-nb0" ];
  services.netbird.clients.nb0 = {
    login.enable = true;
    login.setupKeyFile = "${config.age.secrets.netbird-pixel.path}";
    environment.NB_MANAGEMENT_URL="https://nb.pablo.ac";
    environment.NB_ALLOW_SERVER_SSH="true";
    port = 51821;
    openFirewall = true;
    openInternalFirewall = true;
  };
}
