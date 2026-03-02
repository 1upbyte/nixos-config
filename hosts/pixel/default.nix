{
  inputs,
  config,
  hostname,
  lib, 
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/programs/hacking
  ];

  # Required for the VirtIO-GPU 3D pipeline to initialize
  boot.initrd.kernelModules = [ "virtio_gpu" ];
  hardware.graphics.enable = true; 

  # Required for D-Bus to communicate with the guest UI
  services.spice-vdagentd.enable = true;

  networking = {
    hostName = "${hostname}";
    nameservers = [
      "9.9.9.9#dns.quad9.net"
      "149.112.112.112#dns.quad9.net"
    ];
  };

  hardware.bluetooth.enable = lib.mkForce false;  

  # Set your time zone.
  time.timeZone = "America/New_York";

  system.stateVersion = "25.11";
}
