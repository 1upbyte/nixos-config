{ pkgs, lib, ... }:
{
  imports = [
    ./network
    ./nix
    ./programs
    ./services
    ./home-manager.nix
    ./users.nix
    ./shell
  ];
  
  programs.nix-ld.enable = true;
  services.upower.enable = true;
  users.mutableUsers = false;
  security.rtkit.enable = true;
  hardware.bluetooth.enable = true;
  boot = {
    # Silent boot
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
    ];
    # Use latest kernel
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    # Enable systemd in phase 1. Used for unlocking root partition with FIDO2/TPM
    initrd.systemd.enable = true;
    # Use the systemd-boot EFI boot loader.
    loader = {
      systemd-boot = {
        enable = true;
        # Limit the number of generations to keep
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    acpi
  ];
}
