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


  boot.loader.efi.canTouchEfiVariables = lib.mkForce false;

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

  nix.settings = {
    extra-substituters = [
      "https://nixos-apple-silicon.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixos-apple-silicon.cachix.org-1:8psDu5SA5dAD7qA0zMy5UT292TxeEPzIz8VVEr2Js20="
    ];
  };

  hardware.apple.touchBar = {
    enable = true;
    settings = {
      MediaLayerDefault = true;
    };
  };
  
  boot.extraModprobeConfig = "options hid_apple swap_opt_cmd=1 swap_fn_leftctrl=1";

  users.users.${username}.hashedPasswordFile = lib.mkForce "${config.age.secrets.passwd-mbp.path}";

  system.stateVersion = "25.05";
}
