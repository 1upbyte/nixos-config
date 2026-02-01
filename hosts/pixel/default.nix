{
  inputs,
  config,
  hostname,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "${hostname}";
    nameservers = [
      "9.9.9.9#dns.quad9.net"
      "149.112.112.112#dns.quad9.net"
    ];
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  system.stateVersion = "25.11";
}
