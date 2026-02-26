{ inputs, pkgs, username, lib, hostname, config, ... }:
{
  imports = [
    inputs.nixos-apple-silicon.nixosModules.default
    ./hardware-configuration.nix
  ];

  hardware.asahi = {
    peripheralFirmwareDirectory = /boot/asahi;
    setupAsahiSound = true;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  environment.systemPackages = with pkgs; [
    asahi-bless
  ];

  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.backend  = "iwd";
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
    hostName = "${hostname}";
    nameservers = [
      "9.9.9.9#dns.quad9.net"
      "149.112.112.112#dns.quad9.net"
    ];
  };



  users.users.${username}.hashedPasswordFile = lib.mkForce "${config.age.secrets.passwd-mbp.path}";

  system.stateVersion = "25.05";
}
